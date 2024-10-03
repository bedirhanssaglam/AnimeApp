import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/network_service.dart';
import '../../domain/repositories/anime_detail_repository.dart';
import '../models/anime_characters.dart';

class AnimeDetailRepositoryImpl implements AnimeDetailRepository {
  AnimeDetailRepositoryImpl(this._networkService);

  final NetworkService _networkService;

  @override
  Future<AnimeCharacters> fetchAnimeCharacters(int id) async {
    try {
      final response = await _networkService.fetchAnimeCharacters(id);

      if (response.isSuccessful) {
        return AnimeCharacters.fromJson(response.body as Map<String, dynamic>);
      } else {
        throw ChopperResponseException(response.error.toString());
      }
    } catch (e) {
      throw ChopperResponseException(e.toString());
    }
  }
}
