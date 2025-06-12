import Foundation
#if canImport(SwiftUI)
import SwiftUI
#endif

struct Workout: Identifiable {
    let id = UUID()
    let date: Date
    let weight: Double
}

#if canImport(SwiftUI)
class WorkoutStore: ObservableObject {
    @Published var workouts: [Workout] = []

    func add(weight: Double) {
        let workout = Workout(date: Date(), weight: weight)
        workouts.append(workout)
    }
}
#else
class WorkoutStore {
    var workouts: [Workout] = []

    func add(weight: Double) {
        let workout = Workout(date: Date(), weight: weight)
        workouts.append(workout)
    }
}
#endif
