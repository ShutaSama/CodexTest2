import Foundation

public struct Workout: Identifiable {
    public let id = UUID()
    public let date: Date
    public let weight: Double
}

public final class WorkoutStore {
    public private(set) var workouts: [Workout] = []

    public init() {}

    public func add(weight: Double, date: Date = Date()) {
        let workout = Workout(date: date, weight: weight)
        workouts.append(workout)
    }
}
