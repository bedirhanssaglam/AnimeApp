import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import '../../app/di/locator.dart';
import '../../app/managers/firebase_crashlytics_manager.dart';
import '../../firebase_options.dart';

class AppInitialize {
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    await configureDependencies();

    final CrashlyticsManager crashlyticsManager = getIt<CrashlyticsManager>();
    crashlyticsManager.initialize();
  }
}
