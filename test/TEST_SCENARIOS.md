# Test Scenarios

| Scenario ID | Module | Scenario | Actor | Priority | Related Requirement |
|---|---|---|---|---|---|
| TS-001 | Authentication | Login with valid username/password | User | High | FR-001 |
| TS-002 | Authentication | Login with invalid credentials | User | High | FR-001 |
| TS-003 | User Management | Create a new user by Admin | Admin | High | FR-002 |
| TS-004 | Permission Management | Update permissions for a non-admin user | Admin | High | FR-003 |
| TS-005 | Contract Management | Create a contract | Sale | High | FR-004 |
| TS-006 | Contract Management | Update a contract | Sale | High | FR-005 |
| TS-007 | Contract Management | Delete a contract with dependent task/payment stage | Sale | High | FR-006 |
| TS-008 | Task Management | Create task in contract context | Sale | High | FR-007 |
| TS-009 | Task Management | Update task details | Sale | Medium | FR-007 |
| TS-010 | Payment Management | Create payment stage with valid date/value | Accountant | High | FR-008 |
| TS-011 | Payment Management | Create payment stage with date outside contract range | Accountant | High | BR-005 |
| TS-012 | Payment Management | Create payment stage that exceeds contract value | Accountant | High | BR-006 |
| TS-013 | Commission | Completed payment triggers commission calculation | System | High | BR-007 |
| TS-014 | Reporting | Review business report screen | Director / Accountant | Medium | FR-010 |
| TS-015 | Export | Export grid content to Excel/PDF | User | Medium | BR-010 |
