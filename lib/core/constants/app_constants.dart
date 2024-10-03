import 'package:flutter/foundation.dart' show immutable;

@immutable
class AppConstants {
  static const String appName = 'Kraken Anime';

  static const String noAnimeFound = 'No anime found.';
  static const String failedToFetchAnimes = 'Failed to fetch animes.';
  static const String failedToFetchAnimeDetails =
      'Failed to fetch anime details.';
  static const String synopsis = 'Synopsis';
  static const String genres = 'Genres';
  static const String episodesCount = 'Episodes Count';
  static const String characters = 'Characters';
}
