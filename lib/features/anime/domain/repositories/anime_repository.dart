import '../../data/models/anime.dart';

abstract class AnimeRepository {
  Future<Anime> fetchAnimes(int page);
}
