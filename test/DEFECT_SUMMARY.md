# Defect Summary

## Source of Evidence
This defect summary is derived from the existing test artifact [N03_TaiLieuTesting.pdf](N03_TaiLieuTesting.pdf), which documents pass/fail outcomes for static and dynamic testing activities.

## Defects Documented in the Existing Test PDF

| Defect ID | Area | Description | Status | Evidence |
|---|---|---|---|---|
| DEF-001 | Login / Forgot Password | Cancel button in the new password request flow did not work as expected. | Fail (fixed) | Existing PDF test evidence |
| DEF-002 | Login / Recovery | Phone/email format validation returned an invalid result in the tested scenario. | Fail (fixed) | Existing PDF test evidence |
| DEF-003 | User Management | Language switching from Vietnamese to English displayed two columns incorrectly. | Fail (fixed) | Existing PDF test evidence |
| DEF-004 | Commission Date | Filtering commission date range from 12/2024 to 01/2025 still displayed old data. | Fail (fixed) | Existing PDF test evidence |
| DEF-005 | Contract Management | Several contract validation scenarios were not properly reflected, such as empty required fields and some invalid input behavior. | Fail (fixed) | Existing PDF test evidence |
| DEF-006 | Contract Management | Contract value = 0 was accepted during test, which indicates an input validation issue. | Fail (fixed) | Existing PDF test evidence |
| DEF-007 | Contract Management | Search with accent/no accent mismatch caused inconsistent results. | Fail (fixed) | Existing PDF test evidence |
| DEF-008 | Contract Management | Wrong contract code input triggered an exception or runtime error. | Fail (fixed) | Existing PDF test evidence |
| DEF-009 | Dashboard | Clicking chart elements did not display the expected data. | Fail (fixed) | Existing PDF test evidence |
| DEF-010 | Payment Management | Payment stage value = 0 was accepted in one test scenario. | Fail (fixed) | Existing PDF test evidence |
| DEF-011 | Payment Management | Empty description field produced incorrect message behavior in payment stage management. | Fail (fixed) | Existing PDF test evidence |

## Defect Interpretation
The repository does not include a standalone defect tracking platform or a fresh execution log. Therefore, the defect summary above should be interpreted as a repository-based, evidence-backed defect inventory extracted from the existing PDF test document, not as newly verified runtime findings from the current session.

## Priority Guidance
| Priority | Meaning |
|---|---|
| P0 | Critical issue that blocks correctness or business integrity |
| P1 | Important functional or validation issue |
| P2 | Lower-priority UI or message quality issue |

## Notes
- Most documented test scenarios in the PDF are Pass.
- The failures listed above were recorded as fixed in the PDF document, but they should be re-confirmed only in a live environment if the project is being handed over for production use.
