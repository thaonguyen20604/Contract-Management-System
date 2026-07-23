# UX/UI Overview

## Product Type
The project is a Windows desktop WinForms application with a role-based navigation layout. It uses a left-side or top-level navigation model with multiple function panels and modal sub-forms.

## UX Characteristics
- Desktop-first workflow
- Role-sensitive navigation panes
- Resource-based multilingual UI support
- Multiple module entry points for contracts, tasks, payments, commissions, users, support, and reports
- Form-based interaction pattern with data grid views, buttons, and detail dialogs

## Confirmed UI Modules
- Login / authentication
- Dashboard / home summary
- Contract management
- Task management
- Payment management
- Commission management
- User management
- Reporting
- Support / chatbot

## Evidence Basis
The structure of the UI is visible in [CNPM-FINAL/CNPM-FINAL/GUI/MainGUI.cs](../CNPM-FINAL/CNPM-FINAL/GUI/MainGUI.cs) and the folder list under [CNPM-FINAL/CNPM-FINAL/GUI/SubItem](../CNPM-FINAL/CNPM-FINAL/GUI/SubItem).

## UX Notes
- The interface design is a traditional desktop form layout rather than a modern responsive web UX.
- The implementation suggests clear functional separation but may require visual consistency review to ensure standardization.
- Current repository evidence does not contain a formal UX test report or usability scoring artifact.
