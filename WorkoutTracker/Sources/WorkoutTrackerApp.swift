#if canImport(SwiftUI)
import SwiftUI

@main
struct WorkoutTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
#else
import Foundation

@main
struct WorkoutTrackerApp {
    static func main() {
        print("WorkoutTracker is only supported on platforms with SwiftUI.")
    }
}
#endif
