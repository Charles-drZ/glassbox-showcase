# CivilDayCore — calendar and time-zone engineering example

An **independently authored Swift 6 demonstration** of calendar-day identity, time-zone capture and daylight-saving boundaries. It illustrates a common problem in day-based interfaces: a *civil day* is not always 24 hours long.

The original GlassBox application has private models and history/storage contracts. **This package is not extracted or adapted from them**. It does **not** implement GlassBox's historical completion addressing, persistence schema, bitmap codec, migration, reward calculation or CloudKit behavior.

The example uses:

- Explicit Gregorian calendar and captured IANA time-zone identifier.
- Wall-clock year/month/day descriptors with date validation.
- `Calendar.date(byAdding: .day, ...)` instead of adding 86,400 seconds.
- Real day intervals, including 23-hour spring and 25-hour autumn DST transitions.
- End-exclusive day membership to avoid double-counting at midnight.
- Swift Testing cases for Budapest DST, zone differences, leap day, invalid dates and year boundaries.

## Run

Requires Swift 6 or newer. From the public showcase repository root:

```sh
swift test --package-path samples/CivilDayCore
```

This is a Foundation-only, side-effect-free calendar exercise. Its tests prove only the new public example, **not** the private GlassBox history engine or physical iOS UI acceptance.

[Habits engineering context](../../docs/habits-week-evidence.md) · [Publication boundary](../../docs/privacy-and-source-code.md)
