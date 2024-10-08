import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show FlutterError;
import 'package:injectable/injectable.dart';

abstract class CrashlyticsManager {
  void initialize();
  void recordError(Object error, StackTrace stackTrace);
}

@LazySingleton(as: CrashlyticsManager)
class FirebaseCrashlyticsManager implements CrashlyticsManager {
  @override
  void initialize() {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  @override
  void recordError(Object error, StackTrace stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  }
}
