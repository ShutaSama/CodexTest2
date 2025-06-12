import Foundation

public struct Workout: Identifiable, Codable {
    public let id: UUID
    public let date: Date
    public let weight: Double

    public init(id: UUID = UUID(), date: Date, weight: Double) {
        self.id = id
        self.date = date
        self.weight = weight
    }
}

public final class WorkoutStore {
    public private(set) var workouts: [Workout] = []
    private let fileURL: URL

    public init(fileURL: URL = WorkoutStore.defaultFileURL) {
        self.fileURL = fileURL
    }

    public func add(weight: Double, date: Date = Date()) {
        let workout = Workout(date: date, weight: weight)
        workouts.append(workout)
    }

    public func save() throws {
        let data = try JSONEncoder().encode(workouts)
        try data.write(to: fileURL, options: .atomic)
    }

    public func load() throws {
        guard FileManager.default.fileExists(atPath: fileURL.path) else {
            workouts = []
            return
        }
        let data = try Data(contentsOf: fileURL)
        workouts = try JSONDecoder().decode([Workout].self, from: data)
    }

    public static var defaultFileURL: URL {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            return dir.appendingPathComponent("workouts.json")
        } else {
            return URL(fileURLWithPath: FileManager.default.currentDirectoryPath).appendingPathComponent("workouts.json")
        }
    }
}
