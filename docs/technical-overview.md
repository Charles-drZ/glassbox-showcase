# Technical overview

GlassBox is an iPhone application built with Swift and SwiftUI. The public description below stays intentionally high level so that the private source code, identifiers, and implementation details remain protected.

## Main technical areas

- **SwiftUI** for the application interface and state-driven screens
- **SwiftData** for local persistence
- **Private CloudKit synchronization** for a user's own data
- **StoreKit 2** as the purchase and subscription foundation
- **HealthKit** for optional activity-aware context
- **Sign in with Apple** for account access
- **Localization** for Hungarian and English interface support

## Product reliability considerations

The application has onboarding, app-state, persistence, restore, and reinstall paths. These areas are treated carefully because data availability and synchronization can affect what a user sees after a new install, relaunch, or restore.

Rewards and companion progression are also designed with repeatable behavior in mind, so they can be checked during regression validation. Release preparation includes reviewing these paths in realistic app sessions, not only reading code or compiling the project.

## Deliberately excluded

This case study does not include code, model definitions, data schemas, class names, proprietary algorithms, bundle identifiers, CloudKit container identifiers, signing details, or internal architecture diagrams.
