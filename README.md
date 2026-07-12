# GlassBox — Public Case Study

GlassBox is an independent iPhone productivity and self-care application. This repository is its public product and development case study.

It gives an iOS hiring manager a concrete view of the product, technical scope, and validation work while the active application repository remains private.

## At a glance

| Area | Detail |
| --- | --- |
| Platform | iPhone |
| Language | Swift |
| UI | SwiftUI |
| Persistence | SwiftData |
| Sync | private CloudKit |
| Purchases | StoreKit 2 |
| Health | HealthKit |
| Authentication | Sign in with Apple |
| Testing | TestFlight, manual, regression |
| Status | Preparing for App Store release |
| Source | Private |

## Product summary

GlassBox is built around a simple idea: productivity should help people feel clear, not guilty. It combines everyday planning with reflection and a light self-care layer, helping people return to their routines after imperfect days.

The current experience is organized around five areas:

- **Self** — daily overview, mood, reflection, and personal context
- **Tasks** — lightweight planning and completion flow
- **Habits** — focused daily routines
- **Journal** — notes, gratitude, and reflection
- **Reward** — gentle progression, rewards, and a companion element

## Product areas and capabilities

- Task planning and completion
- Habit tracking and daily focus
- Mood tracking and reflection
- Journal and gratitude entries
- HealthKit-based context
- Rewards and companion progression
- Hungarian and English interface support
- Onboarding, persistence, restore, and reinstall considerations

## What I owned

As an independently developed project, I have been responsible for:

- Product definition and feature scoping
- SwiftUI implementation
- Persistence and sync behavior
- Onboarding and restore flows
- Localization
- TestFlight validation
- Manual and regression testing
- Release preparation
- Workflow design and project documentation

## Product decisions

- Choosing a calm, non-punitive productivity model
- Keeping task, habit, mood, journal, and reward flows connected but understandable
- Treating restore and reinstall behavior as release-critical
- Keeping the source private while documenting the product publicly
- Using AI tools as assistance, with final decisions and validation kept human-led

## Technology stack

Swift · SwiftUI · SwiftData · private CloudKit sync · StoreKit 2 · HealthKit · Sign in with Apple · Xcode · TestFlight

## Current status

GlassBox is currently in TestFlight and preparing for App Store release. The focus is on validation, restore and persistence reliability, and release readiness. No App Store publication is claimed here.

## Testing approach

Testing combines TestFlight builds with manual functional checks, regression passes, issue reproduction, persistence and restore checks, and runtime validation appropriate to the change. A successful build is treated as useful evidence, not as proof of all runtime behavior.

## Selected technical challenges

- Maintaining understandable app state across onboarding, local persistence, sync, restore, and reinstall paths
- Treating CloudKit synchronization and restore behavior as runtime-sensitive work
- Making reward and progression flows safe to re-check during regression testing
- Balancing a calm product experience with clear, testable behavior

## Roadmap direction

The public roadmap direction is intentionally high level: continue validation, improve release readiness, and evolve the iPhone experience after the baseline is reliable. Detailed planning and implementation remain private.

## Visual preview

Screenshots will be added only after privacy review and UI stabilization. No images, mockups, or private assets are published yet.

| Planned capture | Purpose |
| --- | --- |
| Self dashboard | Show the calm daily overview. |
| Tasks | Show lightweight planning and completion. |
| Habits | Show focused daily routines. |
| Journal | Show the reflection area with safe example content. |
| Reward / companion | Show the gentle progression layer. |
| Onboarding | Show the first-run experience. |
| HealthKit context | Include only when the displayed data is safe. |

See the [screenshot publication plan](assets/SCREENSHOT_PLAN.md). An App Store link will be added after public release.

## Supporting documentation

- [Product overview](docs/product-overview.md)
- [Technical overview](docs/technical-overview.md)
- [Testing and validation](docs/testing-and-validation.md)
- [Development lessons](docs/development-lessons.md)
- [Privacy and source code](docs/privacy-and-source-code.md)
- [Changelog](CHANGELOG.md)

## Why the source is private

GlassBox is an active independent product. Its private repository contains implementation, assets, product logic, and release work; this public documentation shows the work without exposing those materials. That boundary protects the project while still making its product and development approach understandable.

## Related repositories

- [Public developer profile](https://github.com/Charles-drZ/Charles-drZ)
- [GlassBox development workflow](https://github.com/Charles-drZ/glassbox-development-workflow)
- [Automation workflow case study](https://github.com/Charles-drZ/automation-workflow-showcase)
- [Raspberry Home documentation case study](https://github.com/Charles-drZ/raspberry-home-showcase)
