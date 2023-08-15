import 'package:eximia_better_now/color_service.dart';
import 'package:eximia_better_now/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int splashScreenDurationInSeconds = 10;
  bool _isLogoVisible = false;

  @override
  Widget build(BuildContext context) {
    if (!_isLogoVisible) _goToHomePage();

    return Scaffold(
      body: _buildSplashScreen(),
    );
  }

  Widget _buildSplashScreen() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: ColorService.black),
      child: Center(child: _buildLogo()),
    );
  }

  Widget _buildLogo() {
    return AnimatedOpacity(
      duration: Duration(seconds: splashScreenDurationInSeconds),
      opacity: _isLogoVisible ? 1.0 : 0.0,
      child: SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.contain,
            color: ColorService.pink,
          )),
    );
  }

  void _goToHomePage() async {
    await Future.delayed(const Duration(seconds: 1), () {});

    setState(() {
      _isLogoVisible = true;
    });

    await Future.delayed(Duration(seconds: splashScreenDurationInSeconds), () {});

    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const HomePage(),
      ),
    );
  }
}
