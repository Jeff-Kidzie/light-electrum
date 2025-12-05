# Lightweight Electrum

A Flutter mobile application for electric bike (e-bike) rental and booking service.


## Tech Stack

### Core
- **Flutter SDK**: ^3.9.2
- **Dart**: ^3.9.2

### State Management
- **flutter_bloc**: ^9.1.1 - BLoC pattern for state management
- **bloc**: ^9.1.0 - Core BLoC library

### Navigation
- **go_router**: ^14.6.2 - Declarative routing

### Firebase
- **firebase_core**: ^2.32.0 - Firebase core functionality
- **firebase_auth**: ^4.17.0 - Firebase Authentication

### UI/Design
- **google_fonts**: ^6.3.2 - Custom fonts
- **lottie**: ^3.3.2 - Animation support
- **cupertino_icons**: ^1.0.8 - iOS-style icons

### Utilities
- **intl**: ^0.20.1 - Internationalization and date formatting
- **json_annotation**: ^4.9.0 - JSON serialization annotations


## Project Structure

```
lib/
├── data/                    # Data models
│   ├── bike.dart           # Bike model
│   ├── bike_detail.dart    # Detailed bike model
│   ├── bike_location.dart  # Location model
│   ├── pricing.dart        # Pricing model
│   ├── specifications.dart # Specifications model
│   └── stat.dart           # Statistics model
│
├── feature/                 # Feature modules
│   ├── auth/               # Authentication feature
│   │   ├── bloc/          # Auth BLoC files
│   │   │   ├── login_bloc.dart
│   │   │   ├── login_event.dart
│   │   │   ├── login_state.dart
│   │   │   ├── register_bloc.dart
│   │   │   ├── register_event.dart
│   │   │   └── register_state.dart
│   │   └── view/          # Auth screens
│   │       ├── login_screen.dart
│   │       └── register_screen.dart
│   │
│   ├── booking/            # Booking feature
│   │   └── bloc/          # Booking BLoC files
│   │       ├── book_form_bloc.dart
│   │       ├── book_form_event.dart
│   │       └── book_form_state.dart
│   │
│   └── home/              # Home feature
│       └── view/          # Home screens
│           ├── bike_detail_screen.dart
│           └── home_screen.dart
│
├── router/                 # Navigation
│   └── app_router.dart    # GoRouter configuration
│
├── screen/                 # Additional screens
│   ├── book_form_screen.dart
│   └── success_book_screen.dart
│
├── service/               # Services
│   └── auth_service.dart  # Firebase Auth service
│
├── theme/                 # Theming
│   ├── app_text_styles.dart
│   └── app_theme.dart
│
├── utils/                 # Utilities
│   └── validators.dart    # Form validators
│
├── widget/                # Reusable widgets
│   ├── app_button.dart
│   ├── app_text_field.dart
│   ├── calendar_dialog.dart
│   ├── card_bike.dart
│   └── chips.dart
│
├── firebase_options.dart  # Firebase configuration
└── main.dart             # App entry point
```

## Firebase Integration

### Prerequisites
1. Install Flutter and Dart SDK
2. Install Firebase CLI: `npm install -g firebase-tools`
3. Install FlutterFire CLI: `flutter pub global activate flutterfire_cli`
4. Create a Firebase project at [Firebase Console](https://console.firebase.google.com)

## Running the App

### Android

Run app:
```bash
flutter run -d emulator-5554 (or replace this with device id from adb)
```

### Web
```bash
flutter run -d chrome
```

# Architecture

The app follows **BLoC (Business Logic Component)** pattern for state management:

### BLoC Pattern Flow
1. **UI** dispatches **Events** to **BLoC**
2. **BLoC** processes events and updates **State**
3. **UI** rebuilds based on new **State**

### Key Components
- **Events**: User actions (button clicks, form inputs)
- **States**: UI states (initial, loading, success, error)
- **BLoCs**: Business logic handlers
- **Repositories**: Data layer (not yet implemented)
- **Services**: External service integrations (Firebase)


## AI tools
Using github copilot, at first i just manual code because i need refreshment knowledge about flutter. Mostly i use in ask mode for foundation, but after foundation complete i use agent mode and double check if implementation is correct

## What to build next?
- Add firebase firestore as remote data source
- Improvement in UI/UX especially success screen

