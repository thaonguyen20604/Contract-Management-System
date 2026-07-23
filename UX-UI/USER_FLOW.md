# User Flow

## Core User Flow

1. User opens the desktop application.
2. Login screen appears.
3. System validates username and password.
4. Main menu loads based on role.
5. User selects a business module such as Contract, Task, Payment, Report, or User.
6. The user performs CRUD or review actions in the corresponding sub-form.
7. Data is saved through the BLL/DAL and SQL-backed business rule layer.
8. The user may export grid content or continue reporting.

## Role-Based Paths

### Director
- Login → Home → Report / Commission screens

### Sale
- Login → Contract / Task / Commission screens

### Accountant
- Login → Payment / Report screens

### Admin
- Login → User Management / Permission screens

## UX Observation
This flow supports a clear desktop operational workflow, but the repo does not contain a formal usability testing report or persona-based journey map.
