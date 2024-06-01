# Kliq Movies
###### Features Implemented:
1. Login and Register
2. Firebase authentication and Storage
3. Fetch latest news through https://newsdata.io/
4. Favourite/UnFavourite News
5. Hive for local storage that save favourite news
6. Light and Dark Mode
7. Fectch user details
8. Custom Widgets
9. Clean Architecture
10. Riverpod as State management

## Get Started
To get started, first clone or download the repository to your pc or laptop. Then run `flutter pub get` command in your terminal to download and cache all the dependencies. After that make sure to run `dart run build_runner build --delete-conflicting-outputs` command to execute the code generator to generate necessary files related to `freezed` and `json serialization`. And you are good to go 🚀.

**To run the app:**
Create .env file and decalare the news API_KEY in that file.
Get API_KEY from https://newsdata.io/ by registering your account.
`API_KEY = '<your api key here>';`

## App Architecture and Folder Structure

The code of the app implements clean architecture to separate the UI, domain and data layers with a features-first approach for folder structure.

#### Folder Structure

```
lib
├── core
│   ├── app_setup
│   │   ├── retrofit
│   │   │    ├── interceptors
│   │   │    ├── api_services.dart
│   │   │    ├── app_endpoint.dart
│   │   │    ├── retrofit_client.dart
│   │   ├── hive
│   │   ├── failure
│   ├── entities
│   ├── extension
│   ├── routes
│   ├── theme
│   ├── utils
│   ├── widgets
├── features
│   ├── auth
│   │   ├── application
│   │   │    ├── auth_controller.dart
│   │   │    ├── app_controller.dart
│   │   ├── infrastructure
│   │   │    ├── entities
│   │   │    ├── ├──users.dart
│   │   │    └── repository
│   │   │    ├── ├──auth_repository.dart
│   │   └── presentation
│   │   │    ├── widgets (custom component)
│   │   │    ├── app_state_observer.dart
│   │   │    ├── login_screen.dart
│   │   │    ├── register_screen.dart
├── my_observer.dart
├── firebase_options.dart
└── main.dart
```
