# Business Rules

## Confirmed Rules from SQL Triggers and Stored Procedures

1. Contract signed date must not be later than the first payment date.
   - Evidence: [CNPM-FINAL/trg_proc.sql](../CNPM-FINAL/trg_proc.sql) — `trg_check_contract_dates`

2. Contract expiration date must be greater than or equal to the last payment date.
   - Evidence: [CNPM-FINAL/trg_proc.sql](../CNPM-FINAL/trg_proc.sql)

3. Payment date must fall within the contract date window.
   - Evidence: [CNPM-FINAL/trg_proc.sql](../CNPM-FINAL/trg_proc.sql) — `trg_check_payment_stage`

4. Total payment amount for a contract cannot exceed the contract total value.
   - Evidence: [CNPM-FINAL/trg_proc.sql](../CNPM-FINAL/trg_proc.sql)

5. A contract status becomes `Completed` when total completed payments reach or exceed contract value.
   - Evidence: [CNPM-FINAL/trg_proc.sql](../CNPM-FINAL/trg_proc.sql) — `sp_update_contract_status`

6. A completed payment automatically creates or updates a commission record for the contract owner.
   - Evidence: [CNPM-FINAL/trg_proc.sql](../CNPM-FINAL/trg_proc.sql) — `sp_create_payment_stage`, `sp_update_payment_stage`

7. Commission date is based on the payment date and the setting value stored in `settings`.
   - Evidence: [CNPM-FINAL/trg_proc.sql](../CNPM-FINAL/trg_proc.sql) — `sp_calculate_commissions`

8. Updating user role or permissions should refresh a role-specific permission set.
   - Evidence: [CNPM-FINAL/trg_proc.sql](../CNPM-FINAL/trg_proc.sql) — `sp_create_user`, `sp_update_user_permissions`

## Business Rule Classification
- Validation rules: date-window, amount cap
- State transition rules: contract status `Completed` / `In Progress`
- Derivation rules: commission amount and commission date
- Security rules: permission list per role
