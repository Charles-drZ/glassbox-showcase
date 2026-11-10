import Foundation
import Testing
@testable import CivilDayCore

struct CivilDayStampTests {
    private let budapest = TimeZone(identifier: "Europe/Budapest")!
    private let utc = TimeZone(secondsFromGMT: 0)!

    private func instant(_ value: String) throws -> Date {
        let formatter = ISO8601DateFormatter()
        return try #require(formatter.date(from: value))
    }

    private func expectError(_ error: CivilDayError, in stamp: CivilDayStamp) {
        do {
            _ = try stamp.interval()
            Issue.record("Expected invalid day descriptor to fail")
        } catch let actual as CivilDayError {
            #expect(actual == error)
        } catch {
            Issue.record("Unexpected failure: \(error)")
        }
    }

    @Test func capturesExplicitTimeZoneRatherThanSystemCalendar() throws {
        let value = try instant("2026-03-29T22:30:00Z")
        let local = CivilDayStamp(capturing: value, in: budapest)
        #expect(local.year == 2026 && local.month == 3 && local.day == 30)
        #expect(local.timeZoneID == "Europe/Budapest")
        let universal = CivilDayStamp(capturing: value, in: utc)
        #expect(universal.day == 29)
    }

    @Test func daylightSavingSpringForwardIsTwentyThreeHours() throws {
        let stamp = CivilDayStamp(year: 2026, month: 3, day: 29, timeZoneID: budapest.identifier)
        #expect(try stamp.interval().duration == 23 * 3_600)
        #expect(stamp.hoursInDay == 23)
    }

    @Test func daylightSavingFallBackIsTwentyFiveHours() throws {
        let stamp = CivilDayStamp(year: 2026, month: 10, day: 25, timeZoneID: budapest.identifier)
        #expect(try stamp.interval().duration == 25 * 3_600)
        #expect(stamp.hoursInDay == 25)
    }

    @Test func movingOneDayDoesNotAssumeTwentyFourHours() throws {
        let march28 = CivilDayStamp(year: 2026, month: 3, day: 28, timeZoneID: budapest.identifier)
        let march29 = try march28.moved(by: 1)
        let march30 = try march29.moved(by: 1)
        #expect(march29.day == 29 && march30.day == 30)
        #expect(march28.timeZoneID == march30.timeZoneID)
        #expect(try march29.interval().duration == 23 * 3_600)
    }

    @Test func nextDayMidnightIsExcludedFromCurrentDay() throws {
        let stamp = CivilDayStamp(year: 2026, month: 3, day: 29, timeZoneID: budapest.identifier)
        let bounds = try stamp.interval()
        #expect(try stamp.contains(bounds.start))
        #expect(try stamp.contains(bounds.end.addingTimeInterval(-1)))
        #expect(try !stamp.contains(bounds.end))
    }

    @Test func oneInstantCanBelongToDifferentCivilDays() throws {
        let value = try instant("2026-03-29T00:30:00Z")
        let tokyo = TimeZone(identifier: "Asia/Tokyo")!
        let losAngeles = TimeZone(identifier: "America/Los_Angeles")!
        let east = CivilDayStamp(capturing: value, in: tokyo)
        let west = CivilDayStamp(capturing: value, in: losAngeles)
        #expect(east.day == 29 && west.day == 28)
        #expect(east != west)
        #expect(try east.contains(value))
        #expect(try west.contains(value))
    }

    @Test func leapDayMovesIntoMarch() throws {
        let stamp = CivilDayStamp(year: 2028, month: 2, day: 29, timeZoneID: budapest.identifier)
        let next = try stamp.moved(by: 1)
        #expect(next.year == 2028 && next.month == 3 && next.day == 1)
    }

    @Test func nonLeapFebruaryTwentyNinthIsRejected() {
        expectError(.invalidDate, in: CivilDayStamp(year: 2027, month: 2, day: 29, timeZoneID: "UTC"))
    }

    @Test func yearBoundaryUsesCalendarArithmetic() throws {
        let last = CivilDayStamp(year: 2026, month: 12, day: 31, timeZoneID: budapest.identifier)
        let first = try last.moved(by: 1)
        #expect(first.year == 2027 && first.month == 1 && first.day == 1)
        #expect(try first.moved(by: -1) == last)
    }

    @Test func invalidMonthIsRejected() {
        expectError(.invalidDate, in: CivilDayStamp(year: 2026, month: 13, day: 1, timeZoneID: "UTC"))
    }

    @Test func unknownZoneIsRejectedRatherThanUsingDefault() {
        expectError(.unknownTimeZone, in: CivilDayStamp(
            year: 2026, month: 5, day: 1, timeZoneID: "Unknown/NotReal"
        ))
    }

    @Test func serializingDayDescriptorDoesNotContainDeviceLocale() throws {
        let value = try instant("2026-10-25T01:30:00Z")
        let captured = CivilDayStamp(capturing: value, in: budapest)
        let encoded = try JSONEncoder().encode(captured)
        let decoded = try JSONDecoder().decode(CivilDayStamp.self, from: encoded)
        #expect(decoded == captured)
        #expect(decoded.timeZoneID == "Europe/Budapest")
        #expect(try decoded.contains(value))
    }
}
