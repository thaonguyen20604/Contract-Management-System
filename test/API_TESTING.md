# API Testing

## Current Status
The repository does not contain a REST API layer, controllers, OpenAPI/Swagger definitions, or a Postman collection. Therefore API testing is marked as Not Available for this codebase.

## API Coverage Table

| API Test ID | Endpoint | Method | Scenario | Expected Status | Expected Result | Execution Status |
|---|---|---|---|---|---|---|
| API-001 | Not Available | Not Available | Desktop application direct SQL access | Not Available | Not Available | Not Available |
| API-002 | Not Available | Not Available | Swagger/OpenAPI | Not Available | Not Available | Not Available |
| API-003 | Not Available | Not Available | Authentication endpoint | Not Available | Not Available | Not Available |

## Evidence Basis
The codebase confirms direct database access from DAL classes and SQL Server stored procedures, not a web API route layer. This is visible in [CNPM-FINAL/CNPM-FINAL/DAL/BaseDAL.cs](../CNPM-FINAL/CNPM-FINAL/DAL/BaseDAL.cs#L10-L84).
