# Non-Functional Requirements

## Overview
These requirements are inferred from the repository structure and application characteristics rather than from a formal NFR specification document.

| NFR ID | Requirement | Category | Evidence | Status |
|---|---|---|---|---|
| NFR-001 | The application shall run on Windows desktop environment with .NET Framework 4.8 runtime. | Compatibility | [CNPM-FINAL/CNPM-FINAL/App.config](../CNPM-FINAL/CNPM-FINAL/App.config) | Confirmed |
| NFR-002 | The application shall use SQL Server as its persistent data layer. | Reliability / Integration | [CNPM-FINAL/table.sql](../CNPM-FINAL/table.sql) | Confirmed |
| NFR-003 | The system shall enforce critical financial rules in the database layer. | Integrity | [CNPM-FINAL/trg_proc.sql](../CNPM-FINAL/trg_proc.sql) | Confirmed |
| NFR-004 | The system shall expose role-based UI hides/shows based on user context. | Security / Access Control | [CNPM-FINAL/CNPM-FINAL/GUI/MainGUI.cs](../CNPM-FINAL/CNPM-FINAL/GUI/MainGUI.cs) | Confirmed |
| NFR-005 | The system shall generate Excel/PDF exports for business review. | Usability / Reporting | [CNPM-FINAL/CNPM-FINAL/BLL/FileBLL.cs](../CNPM-FINAL/CNPM-FINAL/BLL/FileBLL.cs) | Confirmed |
| NFR-006 | Translation support shall be available through resource files. | Internationalization | [CNPM-FINAL/CNPM-FINAL/GUI/MainGUI.en.resx](../CNPM-FINAL/CNPM-FINAL/GUI/MainGUI.en.resx) and Vietnamese resources | Confirmed |
| NFR-007 | The project should support single-instance startup. | Operational Stability | [CNPM-FINAL/CNPM-FINAL/Program.cs](../CNPM-FINAL/CNPM-FINAL/Program.cs) | Confirmed |
| NFR-008 | No formal performance, load, or security test evidence was found in the repo. | Testing Gap | Repository scan | Needs Confirmation |

## Observed Constraints
- Desktop-only deployment model
- Strong coupling to SQL Server configuration
- Access control depends on DB-stored permissions
- No automated quality gate or CI configuration was found in the workspace

## Risks
- Hardcoded credentials or sensitive keys may be present in source and should be reviewed before release.
- The application has not been verified end-to-end in the current environment.
