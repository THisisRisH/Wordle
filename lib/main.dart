import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:wordle/services/analytics.dart';

import 'controller/game_controller.dart';
import 'overlays/base_overlay.dart';
import 'screens/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  registorSingletons();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await gameController.loadWords();
  await Firebase.initializeApp();
  Analytics.initFireBase();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var routes = {
    LandingPage.routeName: (context) => const LandingPage(),
  };

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 3120),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: LandingPage.routeName,
        routes: routes,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child!,
          );
        },
      ),
    );
  }
}

void registorSingletons() {
  // Register singletons here
  GetIt.I.registerLazySingleton<GameController>(() => GameController());
  GetIt.I.registerLazySingleton<BaseOverlay>(() => BaseOverlay());
}

GameController get gameController => GetIt.I.get<GameController>();
BaseOverlay get baseOverlay => GetIt.I.get<BaseOverlay>();
