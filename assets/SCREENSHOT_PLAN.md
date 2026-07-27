[← GlassBox case study](../README.md)

# Screenshot publication plan

Four privacy-reviewed screenshots are published in the case study. Add further captures only after privacy review and UI stabilization.

## Capture status

1. **Self — energy check-in**  
   - [x] Published as `visuals/glassbox-self-energy-check-in.avif`

2. **Tasks — empty state**  
   - [x] Published as `visuals/glassbox-tasks-empty-state.avif`

3. **Habits — daily plan**  
   - [x] Published as `visuals/glassbox-habits-daily-plan.avif`

4. **Journal**  
   - [ ] Add only with non-personal sample content.

5. **Reward / companion**  
   - [x] Published as `visuals/glassbox-reward-companion.avif`

6. **Onboarding**  
   - [ ] Add a safe first-run screen when stable.

7. **Optional — HealthKit context**  
   - [ ] Use only if every displayed value is explicitly approved.

## Capture guidance

- Use a consistent iPhone device frame or clean full-screen capture.
- Prefer a consistent portrait export size for all captures.
- Use real, reviewed application captures only; do not substitute generated mockups.
- Crop away notifications, unrelated app content, and personal status-bar information.
- Use only reviewed text and safe or explicitly approved demonstration data.
- Keep the image focused on one product area at a time.
- Remove image metadata before publication.

## Never include

- Personal names, journal entries, or other user-identifying content
- Unapproved HealthKit, mood, activity, or account data
- Debug overlays, logs, or internal build identifiers
- Notifications, account details, or status-bar personal data
- Private URLs, identifiers, source material, or unreleased product details

## Pre-publication checklist

- [ ] The screen reflects a stable, intended UI state.
- [ ] All visible content is synthetic or explicitly approved for publication.
- [ ] No personal, account, diagnostic, or unapproved health information is visible.
- [ ] Device-frame and crop treatment are consistent with the other captures.
- [ ] Image metadata has been removed and reviewed.
- [ ] The capture has received final owner and privacy approval.
- [ ] Desktop and mobile GitHub rendering have been reviewed.
- [ ] Public safety CI passes before merge.

---

[← Return to GlassBox case study](../README.md)
