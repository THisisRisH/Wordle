import 'package:flutter/material.dart';
import 'package:wordle/screens/landing_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  var routes = {
    LandingPage.routeName : (context) => LandingPage(),
  }
;
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: LandingPage.routeName,
      routes: routes,
      
    );
  }
}

