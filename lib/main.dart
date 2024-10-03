import 'dart:async' show Future, runZonedGuarded;

import 'package:anime/core/constants/app_constants.dart';
import 'package:anime/core/init/app_initialize.dart';
import 'package:flutter/material.dart';

import 'app/di/locator.dart';
import 'app/managers/firebase_crashlytics_manager.dart';
import 'features/anime/presentation/view/anime_view.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    final AppInitialize appInitialize = AppInitialize();
    await appInitialize.initialize();

    runApp(const _KrakenAnime());
  }, (error, stack) => getIt<CrashlyticsManager>().recordError(error, stack));
}

class _KrakenAnime extends StatelessWidget {
  const _KrakenAnime();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: ThemeData.dark(),
      home: const AnimeView(),
    );
  }
}
