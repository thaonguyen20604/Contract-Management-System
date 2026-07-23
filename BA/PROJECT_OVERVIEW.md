# Project Overview

## Business Context
The project implements a contract management workflow for a business environment where contract lifecycle, commission, and payment tracking need to be handled in a unified desktop application.

## Problem Statement
The system exists to centralize contract data and related operational activities that previously would be managed through multiple isolated processes. The codebase shows support for contract creation, payment stage tracking, task progress management, role-specific permissions, and commission reporting.

## Project Objectives
- Centralize contract information and related activity history.
- Enforce role-based access to business modules.
- Ensure business rules for payment and contract date consistency are validated in the database.
- Support reporting and documentation for management review.

## Stakeholders
| Stakeholder | Role in Project |
|---|---|
| Admin | User and permission management |
| Director | Reporting and high-level oversight |
| Sale | Contract and task ownership |
| Accountant | Payment monitoring and financial operations |
| Development Team | Implementation and maintenance |

## Target Users
- Internal staff within contract sales and finance workflows
- Project admin role for user administration
- Directors using business report screens

## Expected Value
- Faster contract tracking
- Better role visibility and permission control
- Automated validation of payment and commission rules
- Consolidated reporting for management decisions

## In Scope
- User login and role selection
- Contract CRUD
- Task progress management
- Payment stage management
- Commission calculation/reporting
- Role-based access control
- Export to Excel/PDF

## Out of Scope
- Public web portal
- REST API service layer
- External payment integration
- Real-time multi-user collaboration
- Automated UI regression suite

## Constraints
- Desktop application only, not a web application
- Direct SQL Server dependency
- Current repository does not include a modern API layer

## Assumptions
- Needs Confirmation: The business process is intended for internal enterprise use, but the exact organization structure is not fully documented in the repo.
- Needs Confirmation: The final business workflow for Director and Accountant roles may require validation in a live environment.

## Dependencies
- SQL Server database configuration from [CNPM-FINAL/App.config](../CNPM-FINAL/CNPM-FINAL/App.config)
- Schema from [CNPM-FINAL/table.sql](../CNPM-FINAL/table.sql)
- Stored procedures and triggers from [CNPM-FINAL/trg_proc.sql](../CNPM-FINAL/trg_proc.sql)
