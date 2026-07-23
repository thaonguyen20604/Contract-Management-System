# User Stories

## Epic: Authenticate and Access the System

### Story US-001
As a user, I want to log in with my username and password so that I can access the system with the correct role privileges.

- Acceptance Criteria:
  - A registered user can sign in.
  - The correct role-specific main menu is shown after login.
  - Unauthorized users are rejected.

### Story US-002
As an admin, I want to create and update user profiles so that the organization has accurate user records.

- Acceptance Criteria:
  - Admin can create new users.
  - Admin can update user details and role assignments.

### Story US-003
As an admin, I want to update user permissions so that access to modules matches the business responsibility.

- Acceptance Criteria:
  - Permission update changes the role-specific capabilities in the database.
  - User permissions are persisted.

## Epic: Manage Contracts

### Story US-004
As a sale user, I want to create a contract so that I can register a customer agreement.

### Story US-005
As a sale user, I want to update contract details so that I can reflect valid changes in the operation.

### Story US-006
As a sale user, I want to delete or block invalid contract records only when no dependent tasks or payments exist so that data remains consistent.

## Epic: Track Tasks and Payments

### Story US-007
As a sale user, I want to create and manage task progress for a contract so that status can be tracked.

### Story US-008
As an accountant, I want to create and update payment stages so that financial milestones are tracked accurately.

### Story US-009
As a system, I want to prevent invalid payment dates and total amount overflow so that financial business rules remain consistent.

## Epic: Manage Commission and Reporting

### Story US-010
As a director or sale user, I want to view commission and report data so that I can perform validation and reporting.

### Story US-011
As a user, I want to export data to Excel or PDF so that I can share or archive business records.
