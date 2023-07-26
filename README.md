# Bemol Test

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Flutter tech challenge for BEMOL DIGITAL

---

## Getting Started 🚀

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
$ flutter run --dart-define="API_URL=https://fakestoreapi.com"

```

Configuration for VSCode: `.vscode/launch.json`
```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Launch BEMOL App",
      "request": "launch",
      "type": "dart",
      "program": "lib/main.dart",
      "args": [
        "--target",
        "lib/main.dart"
      ],
      "toolArgs": [
        "--dart-define",
        "API_URL=https://fakestoreapi.com",
      ]
    },
  ]
}
```

---

## Design and Architecture 🏛

This project aims to follow the Clean Architecture principles, separating the project into layers, each with its own responsibility. The project is divided into the following layers:
- **Presentation**: Layer responsible for the presentation of data to the user, it is the layer that contains the UI and the application logic.
- **Domain**: Layer responsible for the business rules, it is the layer that contains the entities, failures and the use cases. This don't ever import any other layer.
- **Data**: Layer responsible for define and implement sources.

Lib tree for the project:

```
📦lib
 ┣ 📂app
 ┃ ┣ 📂core
 ┃ ┃ ┗ 📜dependency_injection.dart // service for injecting dependencies
 ┃ ┣ 📂view
 ┃ ┃ ┣ 📂theme
 ┃ ┃ ┃ ┣ 📜bemol_colors.dart // define all colors used in the app
 ┃ ┃ ┃ ┗ 📜light_theme.dart // define MaaterialThemeData for light theme
 ┃ ┃ ┣ 📜app_routes.dart // define all named routes available in the app
 ┃ ┃ ┣ 📜assets_paths.dart // define all assets paths used in the app
 ┃ ┃ ┗ 📜bemol_app.dart // create a MaterialApp with all configurations
 ┃ ┗ 📜app.dart // exports
 ┣ 📂l10n
 ┃ ┣ 📂arb
 ┃ ┃ ┣ 📜app_en.arb // english translations
 ┃ ┃ ┗ 📜app_pt.arb // portuguese translations
 ┃ ┗ 📜l10n.dart // exports
 ┣ 📂src
 ┃ ┣ 📂data // Data layer
 ┃ ┃ ┣ 📂http // where classes (contracts and implementations) for http protocol are in
 ┃ ┃ ┗ 📂storages // where classes (contracts and implementations) for local storage are in
 ┃ ┣ 📂domain // Domain layer: entities, failures and use_cases
 ┃ ┃ ┣ 📂entities
 ┃ ┃ ┃ ┗ 📜entity.dart // base class for all entities extends
 ┃ ┃ ┣ 📂failures
 ┃ ┃ ┃ ┗ 📜failure.dart // base class for all failures extends
 ┃ ┃ ┗ 📂use_cases 
 ┃ ┃ ┃ ┗ 📜use_case.dart // base class for all use cases extends
 ┃ ┗ 📂presenter
 ┃ ┃ ┣ 📂stores // shared state management classes
 ┃ ┃ ┗ 📂view // where all pages and widgets are in
 ┃ ┃ ┃ ┣ 📂pages
 ┃ ┃ ┃ ┃ ┣ 📂error
 ┃ ┃ ┃ ┃ ┣ 📂favorites
 ┃ ┃ ┃ ┃ ┗ 📂home
 ┃ ┃ ┃ ┗ 📂widgets
 ┣ 📜bootstrap.dart // setup dependencies injection and other configs 
 ┗ 📜main.dart // entry point for Dart
```


Dependencies:

 - [dartz](https://pub.dev/packages/dartz): Functional programming in Dart.
 - [dio](https://pub.dev/packages/dio): A powerful Http client for Dart, which supports Interceptors, FormData, Request Cancellation, File Downloading, Timeout etc.
 - [flutter_localizations](https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html): Oficial Flutter package to deal with i18n/l10n (internationalization/localization).
 - [google_fonts](https://pub.dev/packages/google_fonts): A package to include fonts from fonts.google.com in your Flutter app.
 - [shared_preferences](https://pub.dev/packages/shared_preferences): Wraps platform-specific persistent storage for simple data.

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test 
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Author 👨‍💻

- **Henrique Nascimento** - [@HenriqueNas](https://github.com/henriquenas)


[coverage_badge]: coverage_badge.svg
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
