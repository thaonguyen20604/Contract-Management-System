# Stakeholder Analysis

| Stakeholder | Role | Needs | Responsibilities | Influence | Communication Needs |
|---|---|---|---|---|---|
| Admin | System administrator | User/account control | Create users, reset passwords, update permissions | High | Role-based permission updates and system health |
| Director | Business oversight | Reporting and summary visibility | Review contract and commission reports | High | Summary dashboards and exception alerts |
| Sale | Contract owner | Manage contracts and task progress | Create/update contracts, track work items | High | Contract details, task progression, commission visibility |
| Accountant | Finance | Payment stage oversight | Add/update payment records, validate payment timing and totals | High | Payment status, contract value alignment |
| Development Team | Implementation owner | Maintain code and business rules | Keep WinForms, DAL, and SQL logic aligned | Medium | Requirement and defect information |

## Evidence Basis
The stakeholder structure is inferred from the role set in [CNPM-FINAL/table.sql](../CNPM-FINAL/table.sql), the role-based menu in [CNPM-FINAL/CNPM-FINAL/GUI/MainGUI.cs](../CNPM-FINAL/CNPM-FINAL/GUI/MainGUI.cs#L180-L260), and the access control code in [CNPM-FINAL/CNPM-FINAL/Context/UserContext.cs](../CNPM-FINAL/CNPM-FINAL/Context/UserContext.cs#L1-L79).
