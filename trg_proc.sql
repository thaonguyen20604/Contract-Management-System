CREATE TRIGGER trg_check_contract_dates
ON contracts
AFTER UPDATE
AS
BEGIN
    -- Khai báo biến để lưu trữ các giá trị ngày ký và ngày hết hạn mới
    DECLARE @contract_id INT;
    DECLARE @new_signed_date DATE;
    DECLARE @new_expiration_date DATE;
    DECLARE @min_payment_date DATE;
    DECLARE @max_payment_date DATE;

    -- Lấy thông tin hợp đồng mới cập nhật
    SELECT @contract_id = id,
           @new_signed_date = signed_date,
           @new_expiration_date = expiration_date
    FROM inserted;

    -- Kiểm tra xem hợp đồng có giao dịch nào phát sinh không
    IF EXISTS (SELECT 1 FROM payment_stages WHERE contract_id = @contract_id)
    BEGIN
        -- Lấy ngày thanh toán nhỏ nhất và lớn nhất từ các giao dịch liên quan đến hợp đồng này
        SELECT @min_payment_date = MIN(payment_date),
               @max_payment_date = MAX(payment_date)
        FROM payment_stages
        WHERE contract_id = @contract_id;

        DECLARE @errSignedDate NVARCHAR(255) = N'Ngày ký hợp đồng không được nhỏ hơn ngày thanh toán đầu tiên của hợp đồng.'  + CHAR(13) + CHAR(10) +  N'The contract signing date cannot be less than the first payment date of the contract.';
        -- Kiểm tra nếu ngày ký không được lớn hơn ngày thanh toán bé nhất
        IF @new_signed_date > @min_payment_date
        BEGIN
            RAISERROR(@errSignedDate, 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

		DECLARE @errExpiredDate NVARCHAR(255) = N'Ngày hết hạn hợp đồng không được bé hơn ngày thanh toán cuối cùng của hợp đồng.'  + CHAR(13) + CHAR(10) +  N'The contract expiration date must be greater than or equal the final payment date of the contract.';
        -- Kiểm tra nếu ngày hết hạn không được nhỏ hơn ngày thanh toán lớn nhất
        IF @new_expiration_date < @max_payment_date
        BEGIN
            RAISERROR(@errExpiredDate, 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END
    END
END;
GO

CREATE TRIGGER trg_check_payment_stage
ON payment_stages
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @contract_id INT;
    DECLARE @total_stage_amount DECIMAL(15, 2);
    DECLARE @contract_value DECIMAL(15, 2);
    DECLARE @contract_start_date DATE;
    DECLARE @contract_end_date DATE;

    -- Lấy contract_id từ các bản ghi mới
    SELECT TOP 1 @contract_id = contract_id FROM inserted;

    -- Lấy thông tin hợp đồng
    SELECT 
        @contract_value = total_value, 
        @contract_start_date = signed_date, 
        @contract_end_date = expiration_date
    FROM contracts
    WHERE id = @contract_id;

    -- Tính tổng giá trị thanh toán của tất cả các giai đoạn cho hợp đồng này
    SELECT @total_stage_amount = SUM(amount)
    FROM payment_stages
    WHERE contract_id = @contract_id;

DECLARE @errorDate NVARCHAR(255) = N'Ngày thanh toán phải nằm trong khoảng thời gian hợp đồng.'  + CHAR(13) + CHAR(10) +  N'Payment date must be within the contract duration.';
    -- Kiểm tra ngày thanh toán nằm trong khoảng thời gian hợp đồng
    IF EXISTS (
        SELECT 1 
        FROM inserted
        WHERE payment_date < @contract_start_date OR payment_date > @contract_end_date
    )
    BEGIN
        RAISERROR (@errorDate, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END


	DECLARE @errTotal NVARCHAR(255) = N'Tổng giá trị thanh toán không được vượt quá giá trị hợp đồng.'  + CHAR(13) + CHAR(10) +  N'Total payment value must not exceed the contract value.';
    -- Kiểm tra tổng giá trị thanh toán không vượt quá giá trị hợp đồng
    IF @total_stage_amount > @contract_value
    BEGIN
        RAISERROR (@errTotal, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
GO

-- Tính tháng nhận hoa hồng vào bảng commissions
CREATE PROCEDURE sp_calculate_commissions
    @payment_date DATE,
	@commission_date DATE OUTPUT
AS
BEGIN
    -- Biến tạm
    DECLARE @value_date_setting INT;

    -- Lấy ngày tính hoa hồng từ bảng settings
    SET @value_date_setting = (SELECT TOP 1 value FROM settings ORDER BY effective_date DESC);

    -- Tính toán ngày commission_date
    SET @commission_date = CASE 
                               WHEN DAY(@payment_date) < @value_date_setting THEN 
                                   DATEFROMPARTS(YEAR(@payment_date), MONTH(@payment_date), 1) -- Ngày đầu tháng hiện tại
                               ELSE 
                                   DATEFROMPARTS(YEAR(@payment_date), MONTH(@payment_date) + 1, 1) -- Ngày đầu tháng kế tiếp
                           END;
END;
GO

-- Procedure kiểm tra và cập nhật trạng thái hợp đồng
CREATE PROCEDURE sp_update_contract_status
    @contract_id INT
AS
BEGIN
    DECLARE @total_payments DECIMAL(15, 2);
    DECLARE @total_value DECIMAL(15, 2);

    -- Tính tổng số tiền đã thanh toán cho contract
    SELECT @total_payments = SUM(amount)
    FROM payment_stages
    WHERE contract_id = @contract_id AND status = N'Completed';

    -- Lấy tổng giá trị của hợp đồng
    SELECT @total_value = total_value
    FROM contracts
    WHERE id = @contract_id;

    -- Cập nhật trạng thái hợp đồng
    IF @total_payments >= @total_value
    BEGIN
        UPDATE contracts
        SET status = N'Completed'
        WHERE id = @contract_id;
    END
    ELSE
    BEGIN
        UPDATE contracts
        SET status = N'In Progress'
        WHERE id = @contract_id;
    END
END;
GO

CREATE PROCEDURE sp_create_payment_stage
    @contract_id INT,
    @stage_name NVARCHAR(255),
    @amount DECIMAL(15, 2),
    @payment_date DATE,
    @description NVARCHAR(MAX),
    @status NVARCHAR(50)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @payment_stage_id INT;
        DECLARE @user_id INT;
        DECLARE @commission_percentage DECIMAL(5, 2);

        -- Tạo mới payment stage
        INSERT INTO payment_stages (contract_id, stage_name, amount, payment_date, description, status)
        VALUES (@contract_id, @stage_name, @amount, @payment_date, @description, @status);

        -- Lấy ID của payment stage mới tạo
        SET @payment_stage_id = SCOPE_IDENTITY();

        -- Nếu status là 'Completed' thì xử lý hoa hồng
        IF @status = N'Completed'
        BEGIN
            -- Lấy thông tin user_id và commission_percentage từ hợp đồng
            SELECT @user_id = user_id, @commission_percentage = commission_percentage
            FROM contracts
            WHERE id = @contract_id;

            -- Tạo mới hoa hồng cho user
			DECLARE @commission_date DATE;
			EXEC sp_calculate_commissions @payment_date, @commission_date = @commission_date OUTPUT;
            INSERT INTO commissions (user_id, payment_stage_id, commission_percentage, commission_amount, commission_date, status)
            VALUES (@user_id, @payment_stage_id, @commission_percentage, (@commission_percentage / 100) * @amount, @commission_date, N'Active');
		END

        -- Gọi procedure để kiểm tra và cập nhật trạng thái hợp đồng
        EXEC sp_update_contract_status @contract_id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO

-- Procedure cập nhật payment stage và xử lý hoa hồng
CREATE PROCEDURE sp_update_payment_stage
    @payment_stage_id INT,
    @new_amount DECIMAL(15, 2),
    @new_payment_date DATE,
    @new_stage_name NVARCHAR(255),
    @new_description NVARCHAR(255),
    @new_status NVARCHAR(50) -- Trạng thái mới của payment stage
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @contract_id INT;
        DECLARE @user_id INT;
        DECLARE @commission_percentage DECIMAL(5, 2);

        -- Lấy thông tin contract_id liên quan đến payment stage
        SELECT @contract_id = contract_id
        FROM payment_stages
        WHERE id = @payment_stage_id;

        -- Cập nhật payment stage
        UPDATE payment_stages
        SET amount = @new_amount,
            payment_date = @new_payment_date,
            description = @new_description,
            stage_name = @new_stage_name,
            status = @new_status
        WHERE id = @payment_stage_id;

        -- Xử lý hoa hồng dựa trên trạng thái mới
        IF @new_status = N'Completed'
        BEGIN
            -- Lấy thông tin user và commission_percentage từ hợp đồng
            SELECT @user_id = user_id, @commission_percentage = commission_percentage
            FROM contracts
            WHERE id = @contract_id;

			DECLARE @commission_date DATE;
			EXEC sp_calculate_commissions @new_payment_date, @commission_date = @commission_date OUTPUT;
            -- Thêm hoa hồng vào bảng commissions
            IF NOT EXISTS (SELECT 1 FROM commissions WHERE user_id = @user_id AND payment_stage_id = @payment_stage_id)
            BEGIN
                INSERT INTO commissions (user_id, payment_stage_id, commission_percentage, commission_amount, commission_date, status)
                VALUES (@user_id, @payment_stage_id, @commission_percentage, (@commission_percentage / 100) * @new_amount, @commission_date, N'Active');
            END
            ELSE
            BEGIN
                -- Cập nhật commission_amount và commission_date nếu commission đã tồn tại
                UPDATE commissions
                SET commission_amount = (@commission_percentage / 100) * @new_amount,
                    commission_date = @commission_date,
                    status = N'Active'
                WHERE user_id = @user_id AND payment_stage_id = @payment_stage_id;
            END
        END
        ELSE IF @new_status = N'Unpaid'
        BEGIN
            -- Xóa hoa hồng liên quan nếu trạng thái chuyển sang Unpaid
            DELETE FROM commissions
            WHERE payment_stage_id = @payment_stage_id;
        END

        -- Gọi procedure kiểm tra và cập nhật trạng thái hợp đồng
        EXEC sp_update_contract_status @contract_id;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO

CREATE PROCEDURE sp_update_contract
        @contract_code NVARCHAR(10),
    @new_contract_code NVARCHAR(10),
    @new_user_id INT,
    @new_commission_percentage DECIMAL(5, 2),
    @new_contract_name NVARCHAR(255),
    @new_contract_content NVARCHAR(MAX),
    @new_signed_date DATE,
    @new_expiration_date DATE,
    @new_partner_name NVARCHAR(255),
    @new_contact_email NVARCHAR(100),
    @new_contact_phone NVARCHAR(15),
	@new_organization_name NVARCHAR(255)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @old_user_id INT;
        DECLARE @contract_id INT;

		DECLARE @errContractCode NVARCHAR(255) = N'Hợp đồng không tồn tại với mã code đã cung cấp.' + CHAR(13) + CHAR(10) + N'Contract does not exist';
        -- Kiểm tra xem contract_code cũ có tồn tại hay không
        IF NOT EXISTS (SELECT 1 FROM contracts WHERE contract_code = @contract_code)
        BEGIN
            RAISERROR(@errContractCode, 16, 1);
            RETURN;
        END

		DECLARE @errNewContractCode NVARCHAR(255) = N'Mã hợp đồng mới đã tồn tại. Vui lòng chọn mã khác.' + CHAR(13) + CHAR(10) + N'New contract code already exists. Please choose another code.';
        -- Lấy contract_id và user_id hiện tại từ hợp đồng theo contract_code cũ
        SELECT @contract_id = id, @old_user_id = user_id
        FROM contracts
        WHERE contract_code = @contract_code;

        -- Kiểm tra xem contract_code mới đã tồn tại hay chưa và không phải là contract_code của hợp đồng đang cập nhật
        IF EXISTS (SELECT 1 FROM contracts WHERE contract_code = @new_contract_code AND contract_code <> @contract_code)
        BEGIN
            RAISERROR(@errNewContractCode, 16, 1);
            RETURN;
        END

        -- Cập nhật thông tin hợp đồng
        UPDATE contracts
        SET user_id = @new_user_id,
            commission_percentage = @new_commission_percentage,
            contract_name = @new_contract_name,
            contract_content = @new_contract_content,
            signed_date = @new_signed_date,
            expiration_date = @new_expiration_date,
            partner_name = @new_partner_name,
            contact_email = @new_contact_email,
            contact_phone = @new_contact_phone,
            contract_code = @new_contract_code,
            updated_at = GETDATE(),
			organization_name = @new_organization_name
        WHERE contract_code = @contract_code;

        -- Nếu user_id thay đổi, đặt trạng thái `commission` của người dùng cũ thành 'inactive'
        IF @old_user_id <> @new_user_id
        BEGIN
            UPDATE commissions
            SET status = N'Inactive'
            WHERE user_id = @old_user_id
            AND EXISTS (
                SELECT 1
                FROM payment_stages ps
                WHERE ps.contract_id = @contract_id
                AND commissions.payment_stage_id = ps.id
            );
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO

CREATE PROCEDURE sp_create_user
    @user_code NVARCHAR(10),
    @role_name NVARCHAR(50),
    @full_name NVARCHAR(100),
    @username NVARCHAR(50),
    @password NVARCHAR(255),
    @email NVARCHAR(100),
    @phone NVARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Thêm user mới vào bảng users
        INSERT INTO users (user_code, role_name, full_name, username, password, email, phone)
        VALUES (@user_code, @role_name, @full_name, @username, @password, @email, @phone);

        -- Lấy ID của user vừa thêm
        DECLARE @user_id INT;
        SET @user_id = SCOPE_IDENTITY();

        -- Thêm quyền cho user theo role
        IF @role_name = N'Sale'
        BEGIN
            INSERT INTO user_permissions (user_id, permission_id)
            SELECT @user_id, id
            FROM permissions
            WHERE name IN ('GET_Contract', 'CREATE_Contract', 'UPDATE_Contract', 'DELETE_Contract',
                           'GET_Task', 'CREATE_Task', 'UPDATE_Task', 'DELETE_Task', 'CommissionReport');
        END
        ELSE IF @role_name = N'Accountant'
        BEGIN
            INSERT INTO user_permissions (user_id, permission_id)
            SELECT @user_id, id
            FROM permissions
            WHERE name IN ('GET_Payment', 'CREATE_Payment', 'UPDATE_Payment', 'DELETE_Payment');
        END
        ELSE IF @role_name = N'Director'
        BEGIN
            INSERT INTO user_permissions (user_id, permission_id)
            SELECT @user_id, id
            FROM permissions
            WHERE name = 'BusinessReport';
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_update_user_permissions
    @username NVARCHAR(50),
    @permissions NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @user_id INT;
        SELECT @user_id = id FROM users WHERE username = @username;

        IF @user_id IS NULL
        BEGIN
            THROW 50000, 'User not found.', 1;
        END

        DELETE FROM user_permissions WHERE user_id = @user_id;

        DECLARE @permission_name NVARCHAR(50);
        DECLARE @permission_id INT;
        DECLARE @pos INT;

        WHILE LEN(@permissions) > 0
        BEGIN
            SET @pos = CHARINDEX(',', @permissions);

            IF @pos = 0
            BEGIN
                SET @permission_name = LTRIM(RTRIM(@permissions));
                SET @permissions = '';
            END
            ELSE
            BEGIN
                SET @permission_name = LTRIM(RTRIM(LEFT(@permissions, @pos - 1)));
                SET @permissions = RIGHT(@permissions, LEN(@permissions) - @pos);
            END

            SELECT @permission_id = id FROM permissions WHERE name = @permission_name;

            IF @permission_id IS NOT NULL
            BEGIN
                INSERT INTO user_permissions (user_id, permission_id)
                VALUES (@user_id, @permission_id);
            END
        END

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


CREATE PROCEDURE [dbo].[sp_update_user]
    @old_user_code NVARCHAR(10),
    @user_code NVARCHAR(10),
    @role_name NVARCHAR(50),
    @full_name NVARCHAR(100),
    @username NVARCHAR(50),
    @email NVARCHAR(100),
    @phone NVARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

		-- Lấy vai trò hiện tại của user
        DECLARE @current_role_name NVARCHAR(50);
        SELECT @current_role_name = role_name FROM users WHERE user_code = @old_user_code;

        -- Cập nhật user
        UPDATE users
		SET user_code = @user_code, full_name = @full_name, username = @username, 
				role_name = @role_name, email = @email, phone = @phone
        WHERE user_code = @old_user_code;

        -- Lấy danh sách quyền hiện tại
        DECLARE @current_permissions NVARCHAR(MAX);
        SELECT @current_permissions = STRING_AGG(p.name, ',')
        FROM user_permissions up
        INNER JOIN permissions p ON up.permission_id = p.id
        INNER JOIN users u ON up.user_id = u.id
        WHERE u.user_code = @user_code;

        -- Danh sách quyền mới
        DECLARE @new_permissions NVARCHAR(MAX);
        IF @role_name = N'Sale'
        BEGIN
            SET @new_permissions = 'GET_Contract,CREATE_Contract,UPDATE_Contract,DELETE_Contract,CommissionReport,GET_Task,CREATE_Task,UPDATE_Task,DELETE_Task';
        END
        ELSE IF @role_name = N'Accountant'
        BEGIN
            SET @new_permissions = 'GET_Payment,CREATE_Payment,UPDATE_Payment,DELETE_Payment';
        END
        ELSE IF @role_name = N'Director'
        BEGIN
            SET @new_permissions = 'BusinessReport';
        END

        -- Kết hợp quyền cũ và quyền mới, loại bỏ trùng lặp
        DECLARE @final_permissions NVARCHAR(MAX);
        WITH CombinedPermissions AS (
            SELECT DISTINCT value AS permission
            FROM (
                SELECT value FROM STRING_SPLIT(@current_permissions, ',')
                UNION
                SELECT value FROM STRING_SPLIT(@new_permissions, ',')
            ) Combined
        )
        SELECT @final_permissions = STRING_AGG(permission, ',')
        FROM CombinedPermissions;

        -- Cập nhật quyền bằng sp_update_user_permissions
        EXEC sp_update_user_permissions @username, @final_permissions;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
