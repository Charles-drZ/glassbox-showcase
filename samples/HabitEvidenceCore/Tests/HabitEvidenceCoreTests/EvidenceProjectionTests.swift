import Testing
@testable import HabitEvidenceCore

struct EvidenceProjectionTests {
    @Test func verifiedSaveIsCompletionEvenWithoutScheduleHistory() {
        let evidence = DayEvidence(completion: .verifiedSaved, schedule: .unavailable, writeReview: .settled)
        #expect(DayEvidenceProjection.state(for: evidence) == .completed)
    }

    @Test func plannedWithoutCompletionIsNotCalledFailure() {
        let evidence = DayEvidence(completion: .verifiedAbsent, schedule: .planned, writeReview: .settled)
        #expect(DayEvidenceProjection.state(for: evidence) == .planned)
    }

    @Test func verifiedUnscheduledDayIsNotCalledPlanned() {
        let evidence = DayEvidence(completion: .verifiedAbsent, schedule: .notPlanned, writeReview: .settled)
        #expect(DayEvidenceProjection.state(for: evidence) == .notScheduled)
    }

    @Test func missingScheduleEvidenceDoesNotBecomeAnObligation() {
        let evidence = DayEvidence(completion: .verifiedAbsent, schedule: .unavailable, writeReview: .settled)
        #expect(DayEvidenceProjection.state(for: evidence) == .unresolved)
    }

    @Test func unavailableCompletionReadCannotBecomeAnAbsentRecord() {
        let evidence = DayEvidence(completion: .unavailable, schedule: .planned, writeReview: .settled)
        #expect(DayEvidenceProjection.state(for: evidence) == .unresolved)
    }

    @Test func pendingCheckAndUndoNeverClaimFinalTruth() {
        for completion: CompletionEvidence in [.verifiedSaved, .verifiedAbsent] {
            let evidence = DayEvidence(completion: completion, schedule: .planned, writeReview: .pending)
            #expect(DayEvidenceProjection.state(for: evidence) == .unresolved)
        }
    }

    @Test func rejectedWriteRequiresNewAuthoritativeRead() {
        let beforeRefresh = DayEvidence(completion: .verifiedSaved, schedule: .planned, writeReview: .needsRefresh)
        #expect(DayEvidenceProjection.state(for: beforeRefresh) == .unresolved)

        let afterRefresh = DayEvidence(completion: .verifiedAbsent, schedule: .planned, writeReview: .settled)
        #expect(DayEvidenceProjection.state(for: afterRefresh) == .planned)
    }

    @Test func verifiedCanonicalSaveIsEnoughForVisibleCompletion() {
        // Derived mirrors and secondary caches deliberately are not inputs to this projection.
        let evidence = DayEvidence(completion: .verifiedSaved, schedule: .planned, writeReview: .settled)
        #expect(DayEvidenceProjection.state(for: evidence) == .completed)
    }
}
