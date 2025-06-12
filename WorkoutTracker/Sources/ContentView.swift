#if canImport(SwiftUI)
import SwiftUI
import Charts
#endif

#if canImport(SwiftUI)
struct ContentView: View {
    @State private var weight: Double = 50
    @StateObject private var store: WorkoutStore

    /// Exposes the underlying store for unit testing.
    var storeRef: WorkoutStore { store }

    init(store: WorkoutStore = WorkoutStore()) {
        _store = StateObject(wrappedValue: store)
    }

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Weight: \(Int(weight)) kg")
                    Slider(value: $weight, in: 0...200, step: 1)
                }
                .padding()

                Button("Add Workout") {
                    store.add(weight: weight)
                }
                .padding()

                Chart(store.workouts) { workout in
                    LineMark(
                        x: .value("Date", workout.date),
                        y: .value("Weight", workout.weight)
                    )
                }
                .chartXAxis {
                    AxisMarks(values: .automatic(desiredCount: 5))
                }
                .frame(height: 200)

                Spacer()
            }
            .navigationTitle("Workout Tracker")
        }
    }
}
#else
/// Placeholder to allow building on platforms without SwiftUI.
struct ContentView {
    var store: WorkoutStore

    init(store: WorkoutStore = WorkoutStore()) {
        self.store = store
    }
}
#endif

#if canImport(SwiftUI)

#Preview {
    ContentView()
}
#endif
