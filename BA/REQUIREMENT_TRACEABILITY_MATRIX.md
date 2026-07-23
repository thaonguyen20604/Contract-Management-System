# Requirement Traceability Matrix

| Requirement ID | Requirement Description | Implementation Evidence | Verification Status |
|---|---|---|---|
| BR-001 | Login support | [CNPM-FINAL/CNPM-FINAL/BLL/UserBLL.cs](../CNPM-FINAL/CNPM-FINAL/BLL/UserBLL.cs) | Code-based evidence + PDF test evidence |
| BR-002 | Contract ownership | [CNPM-FINAL/CNPM-FINAL/BLL/ContractBLL.cs](../CNPM-FINAL/CNPM-FINAL/BLL/ContractBLL.cs) | Code-based evidence + PDF test evidence |
| BR-004 | Payment stage tracking | [CNPM-FINAL/CNPM-FINAL/BLL/PaymentStageBLL.cs](../CNPM-FINAL/CNPM-FINAL/BLL/PaymentStageBLL.cs) | Code-based evidence + PDF test evidence |
| BR-005 | Payment date within contract duration | [CNPM-FINAL/trg_proc.sql](../CNPM-FINAL/trg_proc.sql) | Database trigger evidence |
| BR-006 | Total payment value not exceed contract total | [CNPM-FINAL/trg_proc.sql](../CNPM-FINAL/trg_proc.sql) | Database trigger evidence |
| BR-007 | Commission calculation | [CNPM-FINAL/trg_proc.sql](../CNPM-FINAL/trg_proc.sql) | Database procedure evidence |
| BR-008 | Role-based permissions | [CNPM-FINAL/CNPM-FINAL/GUI/SubItem/User/UpdatePermissionGUI.cs](../CNPM-FINAL/CNPM-FINAL/GUI/SubItem/User/UpdatePermissionGUI.cs) | Code and SQL evidence |
| BR-010 | Export capability | [CNPM-FINAL/CNPM-FINAL/BLL/FileBLL.cs](../CNPM-FINAL/CNPM-FINAL/BLL/FileBLL.cs) | Code-based evidence + PDF test evidence |
| FR-010 | Reporting | [CNPM-FINAL/CNPM-FINAL/BLL/ReportBLL.cs](../CNPM-FINAL/CNPM-FINAL/BLL/ReportBLL.cs) | Code-based evidence + PDF test evidence |

## Notes
The PDF testing artifact confirms that several workflows already passed in the documented test process. The matrix now reflects this evidence-backed status without claiming fresh runtime execution in the current session.
