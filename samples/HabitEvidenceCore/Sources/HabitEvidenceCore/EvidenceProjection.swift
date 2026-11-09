/// A self-contained public example, not code extracted from the GlassBox application.
/// Models only what a read-only day cell may claim from supplied evidence.
public enum CompletionEvidence: Sendable, Equatable {
    case verifiedSaved
    case verifiedAbsent
    case unavailable
}

public enum ScheduleEvidence: Sendable, Equatable {
    case planned
    case notPlanned
    case unavailable
}

public enum WriteReview: Sendable, Equatable {
    case settled
    case pending
    case needsRefresh
}

public struct DayEvidence: Sendable, Equatable {
    public let completion: CompletionEvidence
    public let schedule: ScheduleEvidence
    public let writeReview: WriteReview

    public init(
        completion: CompletionEvidence,
        schedule: ScheduleEvidence,
        writeReview: WriteReview
    ) {
        self.completion = completion
        self.schedule = schedule
        self.writeReview = writeReview
    }
}

public enum DayDisplayState: String, Sendable, Equatable {
    case completed
    case planned
    case notScheduled
    case unresolved
}

public enum DayEvidenceProjection {
    /// A pending write or an outcome awaiting reconciliation never becomes a success badge.
    /// The caller must first supply refreshed, authoritative evidence.
    public static func state(for evidence: DayEvidence) -> DayDisplayState {
        guard evidence.writeReview == .settled else { return .unresolved }

        switch evidence.completion {
        case .verifiedSaved:
            return .completed
        case .unavailable:
            return .unresolved
        case .verifiedAbsent:
            switch evidence.schedule {
            case .planned:
                return .planned
            case .notPlanned:
                return .notScheduled
            case .unavailable:
                return .unresolved
            }
        }
    }
}
