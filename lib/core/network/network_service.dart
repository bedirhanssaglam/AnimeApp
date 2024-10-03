import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';

import '../constants/service_constants.dart';

part 'network_service.chopper.dart';

@ChopperApi()
abstract class NetworkService extends ChopperService {
  @Get(path: ServiceConstants.topAnime)
  Future<Response> fetchAnimeList(@Query(ServiceConstants.page) int page);

  @Get(path: ServiceConstants.animeCharacters)
  Future<Response> fetchAnimeCharacters(@Path(ServiceConstants.id) int animeId);

  @factoryMethod
  static NetworkService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(ServiceConstants.baseUrl),
      services: [_$NetworkService()],
      converter: const JsonConverter(),
    );
    return _$NetworkService(client);
  }
}
