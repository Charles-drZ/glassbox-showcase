[← Developer profile](https://github.com/Charles-drZ)

# GlassBox

**An independent Apple-platform productivity and self-care product built around “Productivity without guilt.”**

GlassBox combines tasks, habits, mood tracking, journaling, health-aware context, rewards, and a companion layer into one calm daily system.

The product is also my primary long-running Apple-platform engineering project: I own product shaping, SwiftUI implementation, persistence and restore behavior, Apple integrations, validation, release preparation, and the engineering workflow around the app.

The application source remains private. This repository shows the product, engineering scope, validation discipline, and privacy-reviewed results without publishing proprietary implementation.

## Product at a glance

**Role:** Independent product developer / engineer  
**Platforms:** iPhone; standalone Settle watchOS meditation experience  
**Core technologies:** Swift, SwiftUI, SwiftData, CloudKit, StoreKit 2, HealthKit, Sign in with Apple, watchOS  
**Validation:** XCTest, manual and regression testing, TestFlight, restore/reinstall checks, physical iPhone and Apple Watch validation  
**Product stage:** iPhone TestFlight hardening; Settle watchOS product hardening  
**Source:** Private by design

## What I own

GlassBox is not a collection of isolated SwiftUI screens. I am responsible for the product as a system, including:

- product definition and feature shaping;
- Swift and SwiftUI implementation;
- state and persistence behavior;
- private CloudKit synchronization;
- restore, relaunch, and reinstall paths;
- StoreKit 2 purchase/subscription foundations;
- HealthKit integration;
- Sign in with Apple;
- localization;
- watchOS runtime, HealthKit, recovery, haptic, and physical-device behavior;
- unit, manual, regression, and physical-device testing;
- TestFlight validation and release-readiness review;
- supporting automation, infrastructure, and durable engineering documentation.

## Product experience

GlassBox is built around a simple idea: productivity should help users regain clarity after imperfect days instead of turning missed tasks into punishment.

The iPhone experience is organized around five connected areas:

- **Self** — daily context, mood, activity-aware information, and reflection;
- **Tasks** — lightweight planning and completion;
- **Habits** — focused daily routines;
- **Journal** — notes, gratitude, and reflection;
- **Reward** — gentle progression and the Vidra companion layer.

Hungarian is the original interface language and English localization is supported.

## Settle on Apple Watch

Settle is the watchOS meditation surface inside the GlassBox product family.

It is no longer only a prototype host. The current implementation has a dedicated standalone Watch target and has been exercised repeatedly on physical Apple Watch hardware.

Current validated product/engineering scope includes:

- 1–60 minute duration selection through the Digital Crown;
- a production meditation renderer and dedicated Watch interaction shell;
- `WKExtendedRuntimeSession` continuity so a session can survive wrist-down / display sleep;
- explicit completion, cancellation, interruption, and recovery semantics;
- HealthKit Mindful Minutes export after truthful completion;
- a bounded heart-rate sensor sidecar that does not save a workout artifact;
- completion haptics;
- HealthKit purpose/permission hardening;
- dedicated Settle Watch icon and product identity;
- generic watchOS builds, focused tests, and repeated physical Apple Watch product smokes.

The Watch owns the active meditation execution experience. iPhone remains the better surface for broader GlassBox context, history, and reflection.

This repository does **not** claim that Settle is App Store shipped. It does claim a working, physically validated watchOS product surface under active hardening.

[Read the Settle watchOS engineering case study →](docs/settle-watchos.md)

## Engineering highlights

### Persistence is product behavior

SwiftData and private CloudKit synchronization are treated as user-facing reliability work, not implementation details. Restore, relaunch, reinstall, and larger-data behavior are validated because a successful compile says nothing about whether a returning user's state is actually safe.

### Apple services are integrated as boundaries

StoreKit 2, HealthKit, Sign in with Apple, CloudKit, TestFlight, and WatchKit each introduce different state, permission, account, or lifecycle boundaries. The product work includes not only wiring these frameworks, but deciding what the app should do when their state is delayed, missing, restored, unavailable, interrupted, or resumed.

### Release work is part of development

GlassBox development includes regression review, release builds, TestFlight sessions, physical-device checks, persistence validation, privacy review, and explicit acceptance of user-facing behavior.

### Physical-device validation is authoritative for Watch behavior

A simulator or successful generic watchOS build is useful evidence, but it is not enough for product acceptance.

Settle work has therefore used physical Apple Watch smokes for runtime continuity, Digital Crown behavior, renderer/motion acceptance, interruption recovery, and other device-specific behavior where the simulator cannot provide equivalent confidence.

## Product preview

> **Language note:** the screenshots intentionally show the original Hungarian interface. They are real privacy-reviewed application captures, not design mocks.

<p align="center">
  <img src="assets/visuals/glassbox-self-energy-check-in.avif" alt="GlassBox guided energy check-in" width="210">
  <img src="assets/visuals/glassbox-tasks-empty-state.avif" alt="GlassBox task empty state" width="210">
  <img src="assets/visuals/glassbox-habits-daily-plan.avif" alt="GlassBox daily habit plan" width="210">
  <img src="assets/visuals/glassbox-reward-companion.avif" alt="GlassBox reward companion and progression" width="210">
</p>

- **Energy check-in** — guided wellbeing input creates visual context for later reflection and trends.
- **Tasks** — a calm task surface with clear hierarchy and a supportive empty state.
- **Habits** — a day-based routine view combines focused habits, progress, and lightweight completion.
- **Reward** — Vidra and the reward layer turn consistent self-care into visible progression without making productivity punitive.

See the [screenshot publication plan](assets/SCREENSHOT_PLAN.md).

## Validation model

Different changes require different evidence. Depending on the risk and product surface, validation can include:

- focused unit or contract-style tests;
- debug and release builds;
- generic iOS/watchOS builds;
- physical iPhone or Apple Watch runs;
- TestFlight sessions;
- manual functional and regression passes;
- issue reproduction and correction verification;
- persistence, relaunch, restore, and reinstall checks;
- explicit product acceptance for visual and behavioral work.

A green build is useful evidence. It is not treated as universal proof that the user-facing path works.

## Engineering system around the app

GlassBox also acts as the anchor for a broader engineering environment:

- [Development workflow](https://github.com/Charles-drZ/glassbox-development-workflow) — scoped delivery, evidence, review, and durable project memory;
- [Automation workflow](https://github.com/Charles-drZ/automation-workflow-showcase) — deterministic evidence collection and review-gated project-memory synchronization;
- production infrastructure work kept private where publishing deployable details would weaken the security boundary.

These systems support product development; the product itself remains the primary source of value.

## Current state

GlassBox is in active TestFlight and release-readiness hardening on iPhone.

Settle is a working and physically validated watchOS meditation experience under continued product hardening. Current work includes interaction polish, HealthKit behavior, statistics/history integration, and release-quality validation.

No App Store publication is claimed until that milestone actually exists.

## Public boundary

This repository does **not** contain:

- GlassBox or Settle source code, diffs, patches, or source excerpts;
- private schemas, identifiers, internal product logic, or implementation topology;
- CloudKit, signing, StoreKit, HealthKit, or account configuration;
- internal tickets, prompts, debug tooling, fixtures, or raw test output;
- unreleased assets, private roadmap details, or real user data.

The material here is independently written for the public portfolio. It is not a redacted copy of the private application repository.

## Explore the case study

- [Product overview](docs/product-overview.md)
- [Technical overview](docs/technical-overview.md)
- [Settle watchOS engineering](docs/settle-watchos.md)
- [Testing and validation](docs/testing-and-validation.md)
- [Development lessons](docs/development-lessons.md)
- [Privacy and source code](docs/privacy-and-source-code.md)
- [Changelog](CHANGELOG.md)

## Related work

- [Developer profile](https://github.com/Charles-drZ/Charles-drZ)
- [Glassoft Agent Runtime](https://github.com/Charles-drZ/glassoft-agent-runtime-showcase)
- [NodeMedic](https://github.com/Charles-drZ/nodemedic-showcase)
- [Raspberry Home](https://github.com/Charles-drZ/raspberry-home-showcase)
- [Development workflow](https://github.com/Charles-drZ/glassbox-development-workflow)
- [Automation workflow](https://github.com/Charles-drZ/automation-workflow-showcase)
