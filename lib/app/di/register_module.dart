import 'package:anime/app/managers/method_channel_manager.dart';
import 'package:injectable/injectable.dart';

import '../../core/network/network_service.dart';
import '../../features/anime/data/repositories/anime_repository_impl.dart';
import '../../features/anime/domain/repositories/anime_repository.dart';
import '../../features/detail/data/repositories/anime_detail_repository_impl.dart';
import '../../features/detail/domain/repositories/anime_detail_repository.dart';

@module
abstract class RegisterModule {
  @factoryMethod
  NetworkService get networkService => NetworkService.create();

  @lazySingleton
  AnimeRepository get animeRepository => AnimeRepositoryImpl(networkService);

  @lazySingleton
  AnimeDetailRepository get animeDetailRepository =>
      AnimeDetailRepositoryImpl(networkService);

  @lazySingleton
  MethodChannelManager get methodChannelManager => MethodChannelManager();
}
