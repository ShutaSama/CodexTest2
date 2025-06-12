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

    func testSaveAndLoad() throws {
        let tempURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(UUID().uuidString + ".json")
        defer { try? FileManager.default.removeItem(at: tempURL) }

        let store = WorkoutStore(fileURL: tempURL)
        store.add(weight: 60, date: Date(timeIntervalSince1970: 0))
        store.add(weight: 70, date: Date(timeIntervalSince1970: 100))
        try store.save()

        let newStore = WorkoutStore(fileURL: tempURL)
        try newStore.load()

        XCTAssertEqual(newStore.workouts.count, 2)
        XCTAssertEqual(newStore.workouts[0].weight, 60)
        XCTAssertEqual(newStore.workouts[1].weight, 70)
    }
}

extension WorkoutModelTests {
    static let allTests = [
        ("testAddWorkout", testAddWorkout),
        ("testSaveAndLoad", testSaveAndLoad)
    ]
}
