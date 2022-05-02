# mahjong_ranking_app

Mahjong Ranking Mobile App

## Getting Started

1. Install flutter
```
https://docs.flutter.dev/get-started/install
```

2. Install flutter dependencies
```shell
flutter pub get
```

3. Activate `very_good_cli` flutter CLI helper
```shell
dart pub global activate very_good_cli
```

4. Run `very_good_cli` to preconfigure dependent packages
```shell
very_good packages get --recursive
```

4. Install & configure flutterfire - more info here -> https://firebase.flutter.dev/docs/cli
```shell
npm install -g firebase-tools
```
```shell
dart pub global activate flutterfire_cli
```
```shell
flutterfire configure
```

5. Copy `config.example.dart` to `config.dart`
```shell
cd lib && cp config.example.dart config.dart
```
