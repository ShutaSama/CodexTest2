import Foundation
#if canImport(SwiftUI)
import SwiftUI
#endif

struct Workout: Identifiable, Codable {
    let id: UUID
    let date: Date
    let weight: Double

    init(id: UUID = UUID(), date: Date, weight: Double) {
        self.id = id
        self.date = date
        self.weight = weight
    }
}

#if canImport(SwiftUI)
class WorkoutStore: ObservableObject {
    @Published var workouts: [Workout] = []
    private let saveURL: URL

    init() {
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first ?? FileManager.default.temporaryDirectory
        saveURL = directory.appendingPathComponent("workouts.json")
        load()
    }

    func add(weight: Double) {
        let workout = Workout(date: Date(), weight: weight)
        workouts.append(workout)
        save()
    }

    private func load() {
        guard let data = try? Data(contentsOf: saveURL) else { return }
        if let decoded = try? JSONDecoder().decode([Workout].self, from: data) {
            workouts = decoded
        }
    }

    private func save() {
        if let data = try? JSONEncoder().encode(workouts) {
            try? data.write(to: saveURL)
        }
    }
}
#else
class WorkoutStore {
    var workouts: [Workout] = []
    private let saveURL: URL

    init() {
        let directory = FileManager.default.temporaryDirectory
        saveURL = directory.appendingPathComponent("workouts.json")
        load()
    }

    func add(weight: Double) {
        let workout = Workout(date: Date(), weight: weight)
        workouts.append(workout)
        save()
    }

    private func load() {
        guard let data = try? Data(contentsOf: saveURL) else { return }
        if let decoded = try? JSONDecoder().decode([Workout].self, from: data) {
            workouts = decoded
        }
    }

    private func save() {
        if let data = try? JSONEncoder().encode(workouts) {
            try? data.write(to: saveURL)
        }
    }
}
#endif
