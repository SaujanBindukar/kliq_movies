# Kliq News
###### Features Implemented:
1. Login and Register
2. Firebase authentication and Storage
    => Save name, email and userId in Firebase storage
4. Fetch latest news through https://newsdata.io/
5. Favourite/UnFavourite News
6. Hive for local storage that save favourite news
7. Light and Dark Mode
8. Fetch user details
9. Custom Widgets
10. Clean Architecture
11. Riverpod as State management
12. Filter news (category, sentiments, language, image)


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
## Firebase Screenshots

![Screenshot 2024-06-02 at 10 13 35 AM](https://github.com/SaujanBindukar/kliq_movies/assets/34705432/1408a6cf-0891-4a2f-bb0f-5e0ef2c3f812)


![Screenshot 2024-06-02 at 10 14 14 AM](https://github.com/SaujanBindukar/kliq_movies/assets/34705432/9850b11f-2faf-492c-9a01-eced18c23374)


## App Demo Video
https://github.com/SaujanBindukar/kliq_movies/assets/34705432/fbfa21de-2817-4fb7-9df5-e98f52501588



## Previews and Screnshots

| Light Mode Screen  |  Dark Mode Screen |
| ------------ | ------------ |
| Home Screen |
|  <img src="https://github.com/SaujanBindukar/kliq_movies/assets/34705432/3cdea5e7-b207-464d-9ab2-70c357ef9e1a" width="350" height="700"> |  <img src="https://github.com/SaujanBindukar/kliq_movies/assets/34705432/c167eb3d-7646-4c88-afee-f50bb5b70f1b" width="350" height="700">  |
| Empty Favourite Screen |
|  <img src="https://github.com/SaujanBindukar/kliq_movies/assets/34705432/f30df6b4-d211-4e15-a13c-4c067ae7717b" width="350" height="700">  |   <img src="https://github.com/SaujanBindukar/kliq_movies/assets/34705432/c0c5105c-1696-4403-8130-61d2ffd34d14" width="350" height="700"> |
| Login Screen |
|  <img src="https://github.com/SaujanBindukar/kliq_movies/assets/34705432/df28ac10-226f-440a-a71a-d9f1b5283f51" width="350" height="700">  |   <img src="https://github.com/SaujanBindukar/kliq_movies/assets/34705432/25aed84a-d3b9-4224-a832-1eed8ea3c911" width="350" height="700"> |
| Register  Screen |
|  <img src="https://github.com/SaujanBindukar/kliq_movies/assets/34705432/48150899-0ba2-484f-be3d-113dad82b060" width="350" height="700">  |   <img src="https://github.com/SaujanBindukar/kliq_movies/assets/34705432/308be093-1cd3-40c6-977f-f907e3c3c739" width="350" height="700"> |
| When news is marked as Favourite   |
|  <img src="https://github.com/SaujanBindukar/kliq_movies/assets/34705432/e79457fd-c60f-4ed4-9148-c10279a47fe3" width="350" height="700">  |   <img src="https://github.com/SaujanBindukar/kliq_movies/assets/34705432/7d777a13-ba5d-4675-844a-d9fd8b67be45" width="350" height="700"> |
| Favourite Screen   |
|  <img src="https://github.com/SaujanBindukar/kliq_movies/assets/34705432/f2c5c37b-1fe1-48ab-a43d-4230efeabdec" width="350" height="700">  |  <img src="https://github.com/SaujanBindukar/kliq_movies/assets/34705432/b727565e-dfb8-495f-910e-2662f38c2767" width="350" height="700">  |
| Profile Screen  |
|  <img src="https://github.com/SaujanBindukar/kliq_movies/assets/34705432/a9cc135e-2ba6-42b2-9815-c0516e256b65" width="350" height="700">  |  <img src="https://github.com/SaujanBindukar/kliq_movies/assets/34705432/fc543c24-ca16-40c2-b366-73f9ca88a0da" width="350" height="700">  |
| News Filter Bottom Sheet |
|  <img src="https://github.com/SaujanBindukar/kliq_movies/assets/34705432/021f8a9f-e806-4b99-bb19-2d21f02b61a7" width="350" height="700">  |   <img src="https://github.com/SaujanBindukar/kliq_movies/assets/34705432/95fb1756-33aa-4ecf-b3c0-85a5f817570c" width="350" height="700"> |





