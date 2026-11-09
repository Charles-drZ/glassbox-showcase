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
    @Test func settledEvidenceHasAnExplicitNineCaseTruthTable() {
        let expected: [(CompletionEvidence, ScheduleEvidence, DayDisplayState)] = [
            (.verifiedSaved, .planned, .completed),
            (.verifiedSaved, .notPlanned, .completed),
            (.verifiedSaved, .unavailable, .completed),
            (.verifiedAbsent, .planned, .planned),
            (.verifiedAbsent, .notPlanned, .notScheduled),
            (.verifiedAbsent, .unavailable, .unresolved),
            (.unavailable, .planned, .unresolved),
            (.unavailable, .notPlanned, .unresolved),
            (.unavailable, .unavailable, .unresolved)
        ]

        for (completion, schedule, output) in expected {
            let evidence = DayEvidence(
                completion: completion,
                schedule: schedule,
                writeReview: .settled
            )
            #expect(DayEvidenceProjection.state(for: evidence) == output)
        }
    }

    @Test func unsettledWriteNeverClaimsFinalTruthForAnyEvidenceCombination() {
        let completions: [CompletionEvidence] = [.verifiedSaved, .verifiedAbsent, .unavailable]
        let schedules: [ScheduleEvidence] = [.planned, .notPlanned, .unavailable]
        let unsettled: [WriteReview] = [.pending, .needsRefresh]

        for review in unsettled {
            for completion in completions {
                for schedule in schedules {
                    let evidence = DayEvidence(
                        completion: completion,
                        schedule: schedule,
                        writeReview: review
                    )
                    #expect(DayEvidenceProjection.state(for: evidence) == .unresolved)
                }
            }
        }
    }

}
