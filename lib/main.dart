import 'dart:async' show Future, runZonedGuarded;

import 'package:anime/app/di/locator.dart';
import 'package:anime/app/managers/firebase_crashlytics_manager.dart';
import 'package:anime/core/constants/app_constants.dart';
import 'package:anime/core/init/app_initialize.dart';
import 'package:anime/features/anime/presentation/view/anime_view.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      final appInitialize = AppInitialize();
      await appInitialize.initialize();

      runApp(const _KrakenAnime());
    },
    (error, stack) => getIt<CrashlyticsManager>().recordError(error, stack),
  );
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
