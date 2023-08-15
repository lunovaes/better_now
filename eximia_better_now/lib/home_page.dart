import 'package:eximia_better_now/color_service.dart';
import 'package:eximia_better_now/onboarding_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int homePageDurationInSeconds = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildHomePage(),
    );
  }

  Widget _buildHomePage() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: ColorService.black),
      child: Center(child: _buildButton()),
    );
  }

  Widget _buildButton() {
    return GestureDetector(
      onTap: () {
        _startGame();
      },
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
            color: ColorService.black, image: const DecorationImage(image: AssetImage("assets/images/logo.png"))),
        child: Center(
            child: Text("Iniciar",
                style: TextStyle(fontFamily: "Beaulieu", color: ColorService.lightTextColor, fontSize: 20))),
      ),
    );
  }

  void _startGame() {
    _goToOnboardingPage();
  }

  void _goToOnboardingPage() async {
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const OnboardingPage(),
      ),
    );
  }
}
