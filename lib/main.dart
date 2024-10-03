import 'dart:async' show Future, runZonedGuarded;

import 'package:anime/core/constants/app_constants.dart';
import 'package:anime/core/init/app_initialize.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'features/anime/presentation/view/anime_view.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    final AppInitialize appInitialize = AppInitialize();
    await appInitialize.initialize();

    runApp(const _KrakenAnime());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
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
