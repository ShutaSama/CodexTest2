import Foundation

struct Workout: Identifiable {
    let id = UUID()
    let date: Date
    let weight: Double
}

class WorkoutStore: ObservableObject {
    @Published var workouts: [Workout] = []

    func add(weight: Double) {
        let workout = Workout(date: Date(), weight: weight)
        workouts.append(workout)
    }
}
