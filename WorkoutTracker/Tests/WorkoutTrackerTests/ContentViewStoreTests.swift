#if !canImport(SwiftUI)
import XCTest
@testable import WorkoutTracker

final class ContentViewStoreTests: XCTestCase {
    func testStoreUpdatesWhenAddingWorkout() {
        let store = WorkoutStore()
        var view = ContentView(store: store)
        XCTAssertEqual(view.store.workouts.count, 0)
        view.store.add(weight: 80)
        XCTAssertEqual(view.store.workouts.count, 1)
    }
}
#endif
