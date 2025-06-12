# CodexTest2

## WorkoutTracker iOS App

This repository now includes a minimal sample iOS application for tracking
workouts with a simple weight log and chart. The app uses SwiftUI and the
`Charts` framework (available on iOS 16 and later) to plot your logged weights
over time.

### How it Works

1. Adjust the weight slider to the value you lifted.
2. Tap **Add Workout** to record the entry.
3. A line chart shows your weight progress.

To open the project in Xcode, navigate to the `WorkoutTracker` folder and use
"Open Package". You can then run the app on an iPhone or simulator.

## WorkoutModel Library

The `WorkoutModel` directory contains a small Swift package with the core
workout data structures. Its tests can be run on Linux with `swift test`.
