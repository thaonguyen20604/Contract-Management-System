# Document

## 1. Project Summary
This repository contains a Windows desktop contract management system built with C# WinForms and SQL Server. The application supports user authentication, role-based permissions, contract lifecycle management, task tracking, payment stage tracking, commission calculation, reporting, and export workflows.

## 2. Evidence-Based Source of Truth
The project documentation in this repository is grounded in the following evidence:
- Source code under the WinForms solution
- SQL schema and business logic in `table.sql` and `trg_proc.sql`
- Existing testing artifact in `Testing/N03_TaiLieuTesting.pdf`
- GUI structure under the `GUI` folder
- Design-related PDFs under the `UX-UI` folder

## 3. Solution Architecture
The application follows a desktop 3-tier structure:
- GUI: WinForms screens and user interaction
- BLL: business logic and orchestration
- DAL: SQL access and stored procedure calls
- SQL Server: persistence, validation, and business rules

## 4. Core Roles
- Admin: user and permission management
- Sale: contract and task management
- Accountant: payment stage management
- Director: dashboard and reporting access

## 5. Main Business Workflows
1. Login with role-based context
2. Create and update contracts
3. Track task progress related to a contract
4. Add and validate payment stages
5. Trigger commission calculation when payment stages are completed
6. Review business reports and export data

## 6. Documentation Package
This repository now includes a consolidated documentation structure:

- BA documentation: `BA/`
- Testing documentation: `test/`
- UX/UI documentation: `UX-UI/`

## 7. Testing Evidence Status
The test package is aligned with the existing repository test artifact rather than with a fresh runtime execution in the current session.

Confirmed evidence:
- Existing PDF test document is available under `Testing/N03_TaiLieuTesting.pdf`
- The PDF includes static and dynamic testing content
- The PDF records several pass cases and a number of fail-fixed issues

Important note:
- No new runtime execution was performed during this documentation pass.
- The test status represented in the markdown files reflects evidence already stored in the repo.

## 8. Known Gaps and Risks
- No REST API layer is implemented in this repository.
- No automated test framework is present.
- The project contains a hardcoded API key in the chatbot support workflow and should be reviewed before production handoff.
- Some UX findings are evidence-based from the interface structure, but not from a formal usability research session.
