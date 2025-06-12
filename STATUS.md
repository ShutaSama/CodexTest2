# プロジェクト現状報告

- このリポジトリには `WorkoutModel` ライブラリと `WorkoutTracker` iOS アプリが含まれている。
- `WorkoutModel` はワークアウトのデータモデルとストアを提供しており、`swift test` でテストが成功する。
- `WorkoutTracker` では SwiftUI と Charts を用いたシンプルなトラッカーを実装しているが、同等のモデル (`Workout` と `WorkoutStore`) が重複している。
- Linux 環境では SwiftUI が利用できないため、`WorkoutTracker` のビルドやテストは失敗する。
