#if canImport(SwiftUI)
import SwiftUI
import Charts
import WorkoutModel
#endif

#if canImport(SwiftUI)
struct ContentView: View {
    @State private var weight: Double = 50
    @State private var store = WorkoutModel.WorkoutStore()
    @State private var workouts: [WorkoutModel.Workout] = []

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
                    workouts = store.workouts
                }
                .padding()

                Chart(workouts) { workout in
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
struct ContentView {}
#endif

#if canImport(SwiftUI)

#Preview {
    ContentView()
}
#endif
