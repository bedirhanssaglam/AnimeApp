<div align="center">
    <h1>Kraken Anime</h1>
</div>

This project is a simple anime application developed using [Flutter](https://flutter.dev/), [Bloc](https://pub.dev/packages/flutter_bloc), [Chopper](https://pub.dev/packages/chopper), [Firebase Crashlytics](https://pub.dev/packages/firebase_crashlytics) and [injectable](https://pub.dev/packages/injectable).

### Project Structure 

```
📂 lib
  📂 app  
  📂 core
  📂 features
  📄 main.dart
📂 test
  📂 bloc
  📂 exceptions
  📂 extensions
  📂 view
  📄 finder_match_extensions.dart
📄 pubspec.yaml   
📄 README.md    
```

### Screenshots

<p float="left">
<table>
    <tbody>
            <td align="center" style="background-color: white">
                <img src="https://github.com/user-attachments/assets/cd568667-2321-4bf7-ab52-fe7e4287743d" width="200"/></a>
            </td>
            <td align="center" style="background-color: white">
               <img src="https://github.com/user-attachments/assets/74655a98-6264-46dc-851a-6ad9f21a6f1e" width="200"/></a>
            </td>
              <td align="center" style="background-color: white">
                <img src="https://github.com/user-attachments/assets/6b5c3a1d-ee85-41cf-bc5a-f510e4f4f053" width="200"/></a>
            </td>
    </tbody>
</table>
</p>

### Features

- **Anime List**: The application fetches the most popular anime series from the [Jikan API](https://docs.api.jikan.moe/), allowing users to discover and explore various titles. It supports pagination, displaying 20 items per page.

- **Detail Page**: When a user taps on an anime item, the application retrieves detailed information via the [Jikan API](https://docs.api.jikan.moe/). The detail page displays the following information:

    - Image: The anime's poster or cover art
    - Title: The name of the anime
    - Rating: The viewer rating score assigned to the anime
    - Genres: The genres the anime falls under (e.g., Action, Drama, etc.)
    - Synopsis: A brief summary of the anime's plot
    - Episodes Count: The total number of episodes in the anime
    - Character List: The characters of the anime along with their images and names

- **Unit and Widget Tests**: The application includes unit tests and widget tests to ensure code quality and verify that the UI behaves as expected.

- **Firebase Crashlytics**: The app integrates with Firebase Crashlytics to track errors.

- **Method Channels**: The application utilizes native method channels to call the fetchAnimeList function. The Flutter UI sends a method call to the native side, which returns a boolean value (true or false). If the response is true, a Bloc event is triggered to initiate the data fetching process.

- **Dependency Injection**: The application utilizes Injectable for managing dependencies, improving modularity and testability.

- **Mocking**: The app employs the Mockito library to create mock objects, allowing for more flexible and reliable testing processes.

- **HTTP Networking**: The application uses Chopper to manage API calls, enabling efficient network communication.

### Setup
1. Install the dependencies:

```bash
flutter pub get
```

2. Configure Firebase:

Follow the [Firebase setup guide](https://firebase.google.com/docs/flutter/setup?hl=en&platform=ios) to set up your Firebase project.
Add your `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) to the respective directories.

3. Run the application:

```bash
flutter run
```

### Requirements
- Flutter 3.7.12 and Dart 2.19.6