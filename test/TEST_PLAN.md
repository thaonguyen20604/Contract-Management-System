# Test Plan

## Introduction
### Purpose
This test plan is derived from the existing repository test artifact [N03_TaiLieuTesting.pdf](N03_TaiLieuTesting.pdf). The intent is to document the test coverage and findings already present in the workspace evidence, rather than to invent new execution results.

### Project Overview
The implemented system is a WinForms contract management application with authentication, user management, contract management, task tracking, payment stage management, commission calculation, and reporting support.

### Testing Objectives
- Summarize the testing evidence already found in the PDF document.
- Preserve the documented static testing and dynamic/unit testing outcomes.
- Track the pass/fail status of key test scenarios already captured in the repository.
- Distinguish confirmed document findings from unverified runtime actions.

## Scope
### In Scope
- Authentication and login validation
- Admin user creation and permission control
- Contract lifecycle operations
- Task progress management
- Payment stage operations
- Commission date configuration and report modules
- Export behavior and UI validation cases captured in the test PDF

### Out of Scope
- Fresh project execution in the current session
- New API testing because no API layer is present
- New automated regression verification

## Test Items
| Module | Evidence Source |
|---|---|
| Authentication | [N03_TaiLieuTesting.pdf](N03_TaiLieuTesting.pdf) |
| User Management | [N03_TaiLieuTesting.pdf](N03_TaiLieuTesting.pdf) |
| Contract Management | [N03_TaiLieuTesting.pdf](N03_TaiLieuTesting.pdf) |
| Task Management | [N03_TaiLieuTesting.pdf](N03_TaiLieuTesting.pdf) |
| Payment Management | [N03_TaiLieuTesting.pdf](N03_TaiLieuTesting.pdf) |
| Commission / Report | [N03_TaiLieuTesting.pdf](N03_TaiLieuTesting.pdf) |
| Database Rules | [CNPM-FINAL/trg_proc.sql](../CNPM-FINAL/trg_proc.sql) |

## Test Approach
- Static testing: documented in the existing test PDF
- Dynamic testing / Unit testing: documented in the existing test PDF
- Negative testing: included in the PDF test cases
- Boundary-value testing: included in the PDF test cases
- Regression coverage: partially documented by existing pass/fail notes
- API testing: Not Available in the repository

## Test Environment
- Source of truth test artifact: [N03_TaiLieuTesting.pdf](N03_TaiLieuTesting.pdf)
- OS: Windows desktop environment
- Application type: WinForms .NET desktop app
- Runtime execution in current session: Not performed

## Entry Criteria
- Existing test evidence must already be available in the repository PDF.
- The project architecture and business logic must be reviewed from code and SQL sources.

## Exit Criteria
- The existing PDF test artifact has been summarized and mapped into project documentation.
- No new unverified runtime claims are added beyond the document evidence.

## Suspension and Resumption Criteria
If a test item lacks fresh execution evidence, it remains marked as “documented in existing PDF” or “needs live verification,” but not as newly executed in-session.

## Risks and Mitigation
| Risk | Mitigation |
|---|---|
| Confusion between evidence and fresh execution | Use the existing PDF as the only test evidence source for this documentation package |
| Missing runtime validation | Clearly mark any result as documented-only or needs live verification |
| Incomplete test coverage | Summarize the PDF’s pass/fail cases and leave the rest as documented gaps |

## Deliverables
- Test summary aligned to the PDF artifact
- Evidence-based test case mapping
- Known defect findings already present in the PDF
- Status note for unverified runtime items

## Defect Management Process
Defects documented in the PDF are treated as repository evidence. Any defect that has not been re-validated in the current environment is not reclassified as newly verified.
