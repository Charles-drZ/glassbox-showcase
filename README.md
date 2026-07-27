[← Developer profile](https://github.com/Charles-drZ)

# GlassBox — Private-Source iPhone Product Case Study

GlassBox is an independently developed iPhone productivity and self-care product. This public repository explains the product, my ownership, the Apple-platform scope, and the validation discipline behind it while the application source and private implementation remain protected.

> **The purpose of this case study is to show that I can shape, build, validate, and prepare a real iOS product for release — not to publish a cleaned copy of its codebase.**

## At a glance

**Role:** Independent product developer  
**Platform:** iPhone  
**Original interface language:** Hungarian; English localization is also supported  
**Core technologies:** Swift, SwiftUI, SwiftData, CloudKit, StoreKit 2, HealthKit, Sign in with Apple  
**Quality work:** Unit, manual, regression, TestFlight, restore, and physical-device validation  
**Product stage:** TestFlight and App Store readiness  
**Application source:** Private by design

## What this proves

- I can take responsibility for an iPhone product beyond individual screens or isolated coding exercises.
- I can connect product decisions, SwiftUI implementation, persistence, Apple-platform services, testing, and release preparation.
- I treat persistence, synchronization, restore, and reinstall behavior as user-facing reliability work.
- I use AI-assisted development inside explicit scope, evidence, privacy, and human-approval boundaries.
- I can document engineering work publicly without exposing proprietary implementation or unreleased product material.

## Product direction

GlassBox is built around a simple idea: productivity should help people regain clarity after imperfect days rather than make them feel guilty.

The experience is organized around five connected areas:

- **Self** — daily context, mood, and reflection;
- **Tasks** — lightweight planning and completion;
- **Habits** — focused daily routines;
- **Journal** — notes, gratitude, and reflection;
- **Reward** — gentle progression and a companion layer.

The product supports Hungarian and English interface use and combines planning with optional health-aware context.

## My ownership

As the independent developer, I am responsible for:

- product definition and feature shaping;
- Swift and SwiftUI development;
- persistence and synchronization behavior;
- onboarding, restore, and reinstall considerations;
- Apple-platform integrations;
- localization;
- unit, manual, and regression testing;
- TestFlight validation;
- release-readiness review;
- workflow design and durable project documentation.

## Engineering scope

The public technical description intentionally stays at platform level:

- **SwiftUI** for the state-driven iPhone experience;
- **SwiftData** for local persistence;
- **private CloudKit synchronization** for user-owned data;
- **StoreKit 2** for purchases and subscription foundations;
- **HealthKit** for optional activity-aware context;
- **Sign in with Apple** for account access;
- **XCTest, Xcode, and TestFlight** for validation and release preparation.

Implementation architecture, identifiers, schemas, product logic, internal tooling, and source code remain private.

## Validation approach

GlassBox is validated through a combination of:

- focused unit and contract-style tests where appropriate;
- physical iPhone builds and targeted runtime checks;
- TestFlight sessions;
- manual functional and regression passes;
- issue reproduction and correction verification;
- persistence, restore, relaunch, and reinstall checks;
- release-build and release-readiness review.

A successful compile is treated as one piece of evidence, not proof that every user-facing path works correctly.

## Current state

GlassBox is in TestFlight and is being prepared for App Store release. Current work focuses on reliability, regression coverage, restore and persistence behavior, product polish, and release readiness. No App Store publication is claimed until the product is publicly available.

## Product preview

> **Language note:** GlassBox was originally designed in Hungarian, so the screenshots intentionally show its native Hungarian interface. This public case study is written in English for international accessibility; the product also supports English localization.

These privacy-reviewed screenshots are real application captures from the current iPhone experience. Visible demonstration values are intentionally retained to show product behavior; no personal display name, journal text, account detail, internal identifier, debug overlay, or private configuration is included.

<p align="center">
  <img src="assets/visuals/glassbox-self-energy-check-in.avif" alt="GlassBox guided energy check-in" width="210">
  <img src="assets/visuals/glassbox-tasks-empty-state.avif" alt="GlassBox task empty state" width="210">
  <img src="assets/visuals/glassbox-habits-daily-plan.avif" alt="GlassBox daily habit plan" width="210">
  <img src="assets/visuals/glassbox-reward-companion.avif" alt="GlassBox reward companion and progression" width="210">
</p>

- **Energy check-in** — A guided wellbeing input turns a subjective state into clear visual context for later trends.
- **Tasks** — A calm task surface with clear hierarchy and an intentionally supportive empty state.
- **Habits** — A day-based habit plan combines routines, progress, and lightweight completion tracking.
- **Reward** — The companion and reward layer turns consistent self-care into visible progression without making productivity punitive.

The screenshots demonstrate product design and user-facing behavior only. They do not expose GlassBox source, architecture, private configuration, or implementation details.

See the [screenshot publication plan](assets/SCREENSHOT_PLAN.md).

## Public boundary

This repository does **not** contain:

- GlassBox source code, diffs, patches, or code excerpts;
- model, schema, class, function, file, or internal identifier details;
- private CloudKit, signing, StoreKit, HealthKit, or account configuration;
- internal tickets, prompts, debug tooling, fixtures, or raw test output;
- unreleased assets, private roadmap detail, or real user data.

The documents here are independently written public case studies, not redacted exports from the private application repository.

## Explore the case study

- [Product overview](docs/product-overview.md)
- [Technical overview](docs/technical-overview.md)
- [Testing and validation](docs/testing-and-validation.md)
- [Development lessons](docs/development-lessons.md)
- [Privacy and source code](docs/privacy-and-source-code.md)
- [Changelog](CHANGELOG.md)

## Related work

- [Developer profile](https://github.com/Charles-drZ/Charles-drZ)
- [Development workflow case study](https://github.com/Charles-drZ/glassbox-development-workflow)
- [Automation workflow case study](https://github.com/Charles-drZ/automation-workflow-showcase)
- [Raspberry Home case study](https://github.com/Charles-drZ/raspberry-home-showcase)
