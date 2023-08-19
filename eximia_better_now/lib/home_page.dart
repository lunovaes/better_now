import 'package:eximia_better_now/color_service.dart';
import 'package:eximia_better_now/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 100.0),
              width: 200,
              height: 100,
              child: Center(
                child: SizedBox(
                    width: 100,
                    child: Image.asset(
                      "assets/images/full_logo.png",
                      fit: BoxFit.contain,
                    )),
              )),
          Container(
            child: Text(
              "Better Now",
              style: TextStyle(fontSize: 50.0, wordSpacing: 2.5, color: ColorService.lightTextColor, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(child: _buildButton())),
          GestureDetector(
            onTap: (() {
              _goToWebSite();
            }),
            child: Container(
                margin: const EdgeInsets.only(bottom: 100.0),
                child: Icon(
                  Icons.shopping_cart,
                  color: ColorService.pink,
                  size: 50,
                )),
          )
        ],
      ),
    );
  }

  Widget _buildButton() {
    return GestureDetector(
      onTap: () {
        _startGame();
      },
      child: Container(
        width: 220,
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorService.pink),
        child: Center(
            child: Text("INICIAR",
                style: TextStyle(
                    fontFamily: "Beaulieu",
                    color: ColorService.lightTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w800))),
      ),
    );
  }

  void _startGame() {
    _goToOnboardingPage();
  }

  void _goToWebSite() {
    launchUrl(Uri.parse("https://eximialoja.com.br"));
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
