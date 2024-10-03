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