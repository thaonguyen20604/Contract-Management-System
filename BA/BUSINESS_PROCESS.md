# Business Process

## High-Level Workflow

1. User logs in.
2. User context loads role and permission list.
3. Sale creates or updates a contract.
4. Sale tracks work via task progress records.
5. Accountant creates payment stages.
6. Database triggers validate dates and totals.
7. Completed payments update contract status.
8. Commission records are created or updated.
9. Director or authorized roles review reports and exports.

## Process Narrative
The contract lifecycle begins with authentication and role selection. Once inside the main desktop application, the user navigates to the contract module. Contract information is then managed, followed by task progress updates and payment milestone entries. As payment stages become completed, the system recalculates commission and updates contract completion state.

## Process Evidence
- Login and role condition: [CNPM-FINAL/CNPM-FINAL/GUI/MainGUI.cs](../CNPM-FINAL/CNPM-FINAL/GUI/MainGUI.cs)
- User context: [CNPM-FINAL/CNPM-FINAL/Context/UserContext.cs](../CNPM-FINAL/CNPM-FINAL/Context/UserContext.cs)
- Database validation: [CNPM-FINAL/trg_proc.sql](../CNPM-FINAL/trg_proc.sql)

## Process Gaps
- No end-to-end business process diagram exists in the repo.
- No formal BPMN artifact was found for the full contract lifecycle.
