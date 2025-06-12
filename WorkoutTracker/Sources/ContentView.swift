import SwiftUI
import Charts

struct ContentView: View {
    @State private var weight: Double = 50
    @StateObject private var store = WorkoutStore()

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

#Preview {
    ContentView()
}
