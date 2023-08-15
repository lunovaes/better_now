import 'package:eximia_better_now/splash_screen.dart';
import 'package:flutter/material.dart';

import 'color_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eximia Better now',
      theme: ThemeData(
          primaryColor: ColorService.black,
          hintColor: ColorService.pink,
          secondaryHeaderColor: ColorService.darkPink,
          fontFamily: "Beaulieu"),
      home: const SplashScreen(),
    );
  }
}
