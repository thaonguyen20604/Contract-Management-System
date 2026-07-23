# Screen Map

## Screen Inventory

| Screen / Module | Evidence Location | Role Coverage | Notes |
|---|---|---|---|
| LoginGUI | [CNPM-FINAL/CNPM-FINAL/GUI/LoginGUI.cs](../CNPM-FINAL/CNPM-FINAL/GUI/LoginGUI.cs) | All | Authentication entry point |
| MainGUI | [CNPM-FINAL/CNPM-FINAL/GUI/MainGUI.cs](../CNPM-FINAL/CNPM-FINAL/GUI/MainGUI.cs) | All | Role-based menu and navigation shell |
| DashboardGUI | [CNPM-FINAL/CNPM-FINAL/GUI/DashboardGUI.cs](../CNPM-FINAL/CNPM-FINAL/GUI/DashboardGUI.cs) | Director / All | Home dashboard hub |
| CreateContractGUI / UpdateContractGUI / ListContractGUI | [CNPM-FINAL/CNPM-FINAL/GUI/SubItem/Contract](../CNPM-FINAL/CNPM-FINAL/GUI/SubItem/Contract) | Sale | CRUD contract flow |
| CreateTaskGUI / ListTaskGUI / UpdateTaskGUI | [CNPM-FINAL/CNPM-FINAL/GUI/SubItem/Task](../CNPM-FINAL/CNPM-FINAL/GUI/SubItem/Task) | Sale | Task progress |
| CreatePaymentGUI / UpdatePaymentGUI / ListPaymentGUI | [CNPM-FINAL/CNPM-FINAL/GUI/SubItem/Payment](../CNPM-FINAL/CNPM-FINAL/GUI/SubItem/Payment) | Accountant | Payment stage tracking |
| ListCommissionGUI / DateCommissionGUI | [CNPM-FINAL/CNPM-FINAL/GUI/SubItem/Commission](../CNPM-FINAL/CNPM-FINAL/GUI/SubItem/Commission) | Sale / Director | Commission review |
| CreateUserGUI / ListUserGUI / UpdateUserGUI / UpdatePermissionGUI | [CNPM-FINAL/CNPM-FINAL/GUI/SubItem/User](../CNPM-FINAL/CNPM-FINAL/GUI/SubItem/User) | Admin | User and permission management |
| PaymentReportGUI / QuantityReportGUI / RevenueReportGUI / StatusReportGUI | [CNPM-FINAL/CNPM-FINAL/GUI/SubItem/Report](../CNPM-FINAL/CNPM-FINAL/GUI/SubItem/Report) | Director / Accountant | Reporting module |
| ChatbotGUI / MainSupportGUI / ContactGUI | [CNPM-FINAL/CNPM-FINAL/GUI/SubItem/Support](../CNPM-FINAL/CNPM-FINAL/GUI/SubItem/Support) | All roles with support access | Support / AI assistance |

## UX Screen Flow
The screen map shows a desktop navigation progression from login to role-specific area to task-specific sub-forms.
