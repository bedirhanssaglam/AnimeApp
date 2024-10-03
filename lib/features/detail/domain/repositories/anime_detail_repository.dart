import '../../data/models/anime_characters.dart';

abstract class AnimeDetailRepository {
  Future<AnimeCharacters> fetchAnimeCharacters(int id);
}
