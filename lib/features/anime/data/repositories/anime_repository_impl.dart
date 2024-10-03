import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/network_service.dart';
import '../../domain/repositories/anime_repository.dart';
import '../models/anime.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  AnimeRepositoryImpl(this._networkService);

  final NetworkService _networkService;

  @override
  Future<Anime> fetchAnimes(int page) async {
    try {
      final response = await _networkService.fetchAnimeList(page);

      if (response.isSuccessful) {
        return Anime.fromJson(response.body as Map<String, dynamic>);
      } else {
        throw ChopperResponseException(response.error.toString());
      }
    } catch (e) {
      throw ChopperResponseException(e.toString());
    }
  }
}
