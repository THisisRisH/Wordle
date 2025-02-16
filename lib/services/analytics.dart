import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class Analytics {
  static FirebaseCrashlytics? firebaseCrashlytics;
  static void initFireBase() {
    firebaseCrashlytics = FirebaseCrashlytics.instance;
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  static Future<void> logException(dynamic error, StackTrace stackTrace) async {
    await firebaseCrashlyticsRecordError(error, stackTrace);
  }

  static Future<void> firebaseCrashlyticsRecordError(
      dynamic error, StackTrace stackTrace) async {
    if (firebaseCrashlytics == null) {
      return;
    }
    await firebaseCrashlytics!.recordError(error, stackTrace);
  }
}
