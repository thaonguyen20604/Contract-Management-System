# Test Cases

> Note: The cases below are derived from the existing testing artifact [N03_TaiLieuTesting.pdf](N03_TaiLieuTesting.pdf). They reflect documented evidence already present in the repository, not fresh execution performed in the current session.

| Test Case ID | Module | Test Scenario | Expected Result | Documented Status | Evidence Source |
|---|---|---|---|---|---|
| TC-01 | Login | Successful login | Access allowed and user navigates to home page | Pass | Existing PDF |
| TC-02 | Login | Invalid login | Error message shown and no login allowed | Pass | Existing PDF |
| TC-03 | Login | Empty username | Validation message shown | Pass | Existing PDF |
| TC-04 | Login | Empty password | Validation message shown | Pass | Existing PDF |
| TC-05 | Login | Show password behavior | Password is displayed correctly | Pass | Existing PDF |
| TC-06 | Login | Forgot password flow | Reset request handled | Pass | Existing PDF |
| TC-07 | Login | Cancel new password request | Cancel button does not work as expected | Fail (fixed) | Existing PDF |
| TC-08 | Login | Phone/email format validation | Invalid format triggers error message | Fail (fixed) | Existing PDF |
| TC-01 | Admin user creation | Create user successfully | Success notification displayed | Pass | Existing PDF |
| TC-02 | Admin user creation | User code with special character | Validation error displayed | Pass | Existing PDF |
| TC-03 | Admin user creation | Email with space / invalid format | Invalid email format warning | Pass | Existing PDF |
| TC-04 | Admin user creation | Empty employee code | Required field validation shown | Pass | Existing PDF |
| TC-05 | Admin user creation | Length validation | Length hint or validation message shown | Pass | Existing PDF |
| TC-06 | Admin user creation | Empty full name | Required field validation shown | Pass | Existing PDF |
| TC-07 | Admin user creation | Empty username | Required field validation shown | Pass | Existing PDF |
| TC-08 | Admin user creation | Empty email | Required field validation shown | Pass | Existing PDF |
| TC-09 | Admin user creation | Empty phone | Required field validation shown | Pass | Existing PDF |
| TC-10 | Admin user creation | Alphabetic phone input | Alphabetic characters are removed or invalid | Pass | Existing PDF |
| TC-11 | Admin user creation | Duplicate employee code | Duplicate warning shown | Pass | Existing PDF |
| TC-01 | User list | Search valid data | Correct search result list displayed | Pass | Existing PDF |
| TC-02 | User list | Search invalid data | No result message displayed | Pass | Existing PDF |
| TC-03 | User list | Edit directly in list | Direct edit is blocked | Pass | Existing PDF |
| TC-04 | User list | Reset password | Password reset success and default password returned | Pass | Existing PDF |
| TC-05 | User list | Admin permission update | Admin cannot update own admin rights | Pass | Existing PDF |
| TC-06 | User list | Sales permission update | Successful permission update and correct restrictions applied | Pass | Existing PDF |
| TC-07 | User list | Accountant permission update | Successful permission update and correct restrictions applied | Pass | Existing PDF |
| TC-08 | User list | Director permission update | Successful permission update and correct restrictions applied | Pass | Existing PDF |
| TC-13 | User update | Toggle language from Vietnamese to English | UI shows two columns incorrectly before fix | Fail (fixed) | Existing PDF |
| TC-01 | Commission date | Filter by date change correctly | Data displayed correctly | Pass | Existing PDF |
| TC-02 | Commission date | End date earlier than start date | Validation message shown | Pass | Existing PDF |
| TC-03 | Commission date | Invalid day = 32 | Validation message shown | Pass | Existing PDF |
| TC-04 | Commission date | Invalid day = 0 | Validation message shown | Pass | Existing PDF |
| TC-05 | Commission date | Day = 3 | Current commission date label displayed correctly | Pass | Existing PDF |
| TC-06 | Commission date | Filter date range from 12/2024 to 01/2025 | Previous data persisted incorrectly before fix | Fail (fixed) | Existing PDF |
| TC-01 | Contract | Search valid contract | Correct result list displayed | Pass | Existing PDF |
| TC-02 | Contract | Search invalid contract | No result message displayed | Pass | Existing PDF |
| TC-03 | Contract | Start date > end date filter | Validation message shown | Pass | Existing PDF |
| TC-04 | Contract | Export with no data | No data to export message shown | Pass | Existing PDF |
| TC-05 | Contract | Export with data | Export success message shown | Pass | Existing PDF |
| TC-06 | Contract | Delete contract | Error notification shown | Pass | Existing PDF |
| TC-17 | Contract | Signed date greater than expiration date | Expiration date must be greater than signed date | Pass | Existing PDF |
| TC-18 | Contract | Valid update | Update success message shown | Pass | Existing PDF |
| TC-19 | Contract | Valid creation | Create success message shown | Pass | Existing PDF |
| TC-20 to TC-31 | Contract | Required field / invalid input / clear behavior | Several failures were logged and marked fixed | Fail (fixed) | Existing PDF |
| TC-32 | Contract | Contract value = 0 | New contract created successfully before fix | Fail (fixed) | Existing PDF |
| TC-33 | Contract | Search with accent / no accent | Search mismatch before fix | Fail (fixed) | Existing PDF |
| TC-34 | Contract | Wrong contract code creation | Runtime error before fix | Fail (fixed) | Existing PDF |
| TC-01 | Task progress | Search valid information | Search result list displayed | Pass | Existing PDF |
| TC-02 | Task progress | Search invalid information | No result message displayed | Pass | Existing PDF |
| TC-03 | Task progress | Date filter invalid order | Validation message shown | Pass | Existing PDF |
| TC-04 | Task progress | Export with no data | No data to export message shown | Pass | Existing PDF |
| TC-05 | Task progress | Export with data | Export success message shown | Pass | Existing PDF |
| TC-06 | Task progress | Delete task | Task no longer shown | Pass | Existing PDF |
| TC-07 | Task progress | Create new task successfully | Success notification shown | Pass | Existing PDF |
| TC-08 to TC-12 | Task progress | Required field validation | Validation messages shown | Pass | Existing PDF |
| TC-01 | Dashboard | Monthly chart display | Chart shown when data exists, otherwise no data shown | Pass | Existing PDF |
| TC-02 to TC-07 | Dashboard | Search and export behavior | Correct list / no result / export success behavior documented | Pass | Existing PDF |
| TC-08 | Dashboard | Click chart | Data not displayed before fix | Fail (fixed) | Existing PDF |
| TC-01 to TC-05 | Payment | Search / export / filter / update | Pass documented in the PDF | Pass | Existing PDF |
| TC-06 | Payment | Delete payment stage | Payment no longer shown | Pass | Existing PDF |
| TC-07 to TC-08 | Payment | Required field validation | Validation messages shown | Pass | Existing PDF |
| TC-09 | Payment | Correct update | Update success shown | Pass | Existing PDF |
| TC-10 | Payment | Stage amount = 0 | Create success before fix | Fail (fixed) | Existing PDF |
| TC-11 | Payment | Empty description field | Validation message shown but message naming issue before fix | Fail (fixed) | Existing PDF |
| TC-01 to TC-04 | Commission report | Search / date filter / no-result behavior | Pass documented in the PDF | Pass | Existing PDF |
