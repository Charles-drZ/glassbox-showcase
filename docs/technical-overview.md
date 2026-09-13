[← GlassBox case study](../README.md)

# Technical overview

GlassBox is primarily an iPhone application built with Swift and SwiftUI, with current watchOS prototype work exploring meditation as a Watch-first execution surface.

The public description stays intentionally high level so private source code, identifiers, schemas, product logic, and deployment configuration remain protected.

## Apple-platform scope

### iPhone product

The main product currently combines:

- **SwiftUI** for the application interface and state-driven screens;
- **SwiftData** for local persistence;
- **private CloudKit synchronization** for user-owned data;
- **StoreKit 2** as the purchase and subscription foundation;
- **HealthKit** for optional activity-aware context;
- **Sign in with Apple** for account access;
- **localization** for Hungarian and English interface support;
- **XCTest, Xcode, TestFlight, and physical-device sessions** for validation and release preparation.

These technologies are treated as product boundaries rather than a checklist of frameworks. Persistence, account state, permissions, purchases, health data, restore behavior, and synchronization can all change what the user experiences at runtime.

### watchOS prototype direction

The current Watch exploration focuses on meditation.

The product direction separates responsibilities between devices: Watch is intended to become the primary meditation execution surface, while iPhone remains better suited to setup, history, and reflection.

The first repository-integrated prototype host has passed a physical Apple Watch launch/build smoke. The visual/motion experience remains prototype work, so this public case study does not claim a completed or shipped watchOS feature.

## Reliability considerations

GlassBox has onboarding, app-state, persistence, restore, relaunch, reinstall, and account-dependent paths. These areas receive targeted validation because data availability and synchronization can affect what a returning user sees after a new install or restore.

Reward and companion progression also need repeatable lifecycle behavior across launches and synchronized state.

Release preparation can therefore require several different forms of evidence:

- unit or contract-style tests;
- debug/release builds;
- physical-device execution;
- TestFlight sessions;
- manual regression passes;
- restore/reinstall checks;
- explicit visual or behavioral acceptance.

A build result is treated as evidence for compilation, not as universal proof of every runtime path.

## Supporting engineering systems

The private GlassBox product is supported by separate engineering systems for:

- accepted-scope and work-state tracking;
- repository/implementation evidence;
- deterministic automation;
- reviewed durable project memory;
- production infrastructure and operational recovery.

Those supporting systems are documented publicly only at sanitized architectural level where appropriate. They are not embedded into the application as a hidden source of product truth.

## Deliberately excluded

This case study does not include source code, model definitions, data schemas, internal type/file names, proprietary algorithms, bundle identifiers, CloudKit container identifiers, signing details, private service endpoints, or deployable internal architecture.

---

[← Return to GlassBox case study](../README.md)
