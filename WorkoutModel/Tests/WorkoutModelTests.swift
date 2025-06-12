import XCTest
@testable import WorkoutModel

final class WorkoutModelTests: XCTestCase {
    func testAddWorkout() {
        let store = WorkoutStore()
        XCTAssertEqual(store.workouts.count, 0)
        store.add(weight: 75)
        XCTAssertEqual(store.workouts.count, 1)
        XCTAssertEqual(store.workouts.first?.weight, 75)
    }
}

extension WorkoutModelTests {
    static let allTests = [
        ("testAddWorkout", testAddWorkout)
    ]
}
