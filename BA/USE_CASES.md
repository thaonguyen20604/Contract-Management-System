# Use Cases

## UC-01: Login
- Primary Actor: User
- Goal: Access the system
- Precondition: User account exists
- Main Flow:
  1. User enters username and password.
  2. System validates credentials.
  3. System loads role and permission context.
  4. Main dashboard opens.
- Alternate Flow:
  - Invalid login rejects access and shows error.

## UC-02: Create User
- Primary Actor: Admin
- Goal: Add a new internal user
- Precondition: Admin is logged in
- Main Flow:
  1. Admin opens create-user form.
  2. Admin enters user information.
  3. System stores the user and applies default role-based permission set.

## UC-03: Update Permission
- Primary Actor: Admin
- Goal: Modify a user's access permissions
- Main Flow:
  1. Admin selects a user.
  2. Admin changes permission list.
  3. System updates the permission mapping in DB.

## UC-04: Create Contract
- Primary Actor: Sale
- Goal: Register a contract
- Main Flow:
  1. Sale opens create-contract form.
  2. Sale fills in contract fields.
  3. System inserts contract and assigns user ownership.

## UC-05: Update Contract
- Primary Actor: Sale
- Goal: Maintain contract details
- Main Flow:
  1. Sale opens an existing contract.
  2. Sale changes values.
  3. System validates business rules and updates the record.

## UC-06: Create Payment Stage
- Primary Actor: Accountant
- Goal: Record payment milestone
- Main Flow:
  1. Accountant selects a contract.
  2. Accountant enters payment amount and date.
  3. System validates date range and total value.
  4. Payment is inserted.

## UC-07: Update Payment Stage and Commission Status
- Primary Actor: Accountant
- Goal: Keep payment history consistent
- Main Flow:
  1. Accountant opens an existing stage.
  2. Accountant updates amount/date/status.
  3. System recalculates commission if status becomes Completed.

## UC-08: View Reports
- Primary Actor: Director / Accountant
- Goal: Review business reports
- Main Flow:
  1. User opens report module.
  2. System loads relevant reports based on permission and data.
