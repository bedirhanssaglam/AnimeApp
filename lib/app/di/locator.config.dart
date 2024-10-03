// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../core/network/network_service.dart' as _i7;
import '../../features/anime/domain/repositories/anime_repository.dart' as _i4;
import '../../features/anime/presentation/bloc/anime_bloc.dart' as _i8;
import '../../features/detail/domain/repositories/anime_detail_repository.dart'
    as _i3;
import '../../features/detail/presentation/bloc/anime_detail_bloc.dart' as _i9;
import '../managers/firebase_crashlytics_manager.dart' as _i5;
import '../managers/method_channel_manager.dart' as _i6;
import 'register_module.dart' as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AnimeDetailRepository>(
      () => registerModule.animeDetailRepository);
  gh.lazySingleton<_i4.AnimeRepository>(() => registerModule.animeRepository);
  gh.lazySingleton<_i5.CrashlyticsManager>(
      () => _i5.FirebaseCrashlyticsManager());
  gh.lazySingleton<_i6.MethodChannelManager>(
      () => registerModule.methodChannelManager);
  gh.factory<_i7.NetworkService>(() => registerModule.networkService);
  gh.factory<_i8.AnimeBloc>(() => _i8.AnimeBloc(get<_i4.AnimeRepository>()));
  gh.factory<_i9.AnimeDetailBloc>(
      () => _i9.AnimeDetailBloc(get<_i3.AnimeDetailRepository>()));
  return get;
}

class _$RegisterModule extends _i10.RegisterModule {}
