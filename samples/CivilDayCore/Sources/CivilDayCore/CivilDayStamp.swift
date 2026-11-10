import Foundation

/// A newly authored, calendar-only public example. It is not the private
/// application's stored-day or bitmap-addressing implementation.
public struct CivilDayStamp: Codable, Equatable, Hashable, Sendable {
    public let year: Int
    public let month: Int
    public let day: Int
    public let timeZoneID: String

    /// Capture a wall-clock day in an explicitly chosen zone, not the
    /// machine's later/current default zone.
    public init(capturing instant: Date, in zone: TimeZone) {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = zone
        self.year = calendar.component(.year, from: instant)
        self.month = calendar.component(.month, from: instant)
        self.day = calendar.component(.day, from: instant)
        self.timeZoneID = zone.identifier
    }

    /// An unchecked descriptor may arrive from JSON; interval() validates it.
    public init(year: Int, month: Int, day: Int, timeZoneID: String) {
        self.year = year
        self.month = month
        self.day = day
        self.timeZoneID = timeZoneID
    }

    public func interval() throws -> DateInterval {
        guard let zone = TimeZone(identifier: timeZoneID) else {
            throw CivilDayError.unknownTimeZone
        }
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = zone

        // Noon is less likely than midnight to be affected by a local
        // daylight-saving transition; validate the requested date explicitly.
        let components = DateComponents(
            calendar: calendar,
            timeZone: zone,
            year: year,
            month: month,
            day: day,
            hour: 12
        )
        guard let noon = calendar.date(from: components) else {
            throw CivilDayError.invalidDate
        }
        let decoded = calendar.dateComponents([.year, .month, .day], from: noon)
        guard decoded.year == year, decoded.month == month, decoded.day == day else {
            throw CivilDayError.invalidDate
        }
        guard let range = calendar.dateInterval(of: .day, for: noon) else {
            throw CivilDayError.invalidDate
        }
        return range
    }

    /// Work in calendar days, rather than adding a fixed 86,400 seconds.
    public func moved(by days: Int) throws -> CivilDayStamp {
        let start = try interval().start
        guard let zone = TimeZone(identifier: timeZoneID) else {
            throw CivilDayError.unknownTimeZone
        }
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = zone
        guard let destination = calendar.date(byAdding: .day, value: days, to: start) else {
            throw CivilDayError.invalidDate
        }
        return CivilDayStamp(capturing: destination, in: zone)
    }

    /// End is excluded, so the following day's midnight is never counted twice.
    public func contains(_ instant: Date) throws -> Bool {
        let range = try interval()
        return instant >= range.start && instant < range.end
    }

    public var hoursInDay: Double? {
        guard let range = try? interval() else { return nil }
        return range.duration / 3_600
    }
}

public enum CivilDayError: Error, Equatable, Sendable {
    case unknownTimeZone
    case invalidDate
}
