import 'package:eximia_better_now/color_service.dart';
import 'package:eximia_better_now/home_page.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  String title = "Better Now";
  String subTitle = "Porque deixar pra depois o que pode ser feito agora?";
  String content =
      "Porque deixar pra depois o que pode ser feito agora? \nO jogo tem o objetivo de \nproporcionar uma experiência \ndiferenciada e profunda entre vocês! \nSão 3 categorias de cartas: \nConecte-se, Prepare-se e Inspire-se! \nRecomendamos que sigam a ordem \ndas cartas das primeiras duas \ncategorias e utilize a última quando \nquiserem se inspirar";

  double titleFontSize = 20.0;
  double subTitleFontSize = 18.0;
  double contentFontSize = 16.0;

  double containerBorderRadius = 20.0;
  double containerMargin = 20.0;
  double containerPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildOnboardingPage(),
    );
  }

  Widget _buildOnboardingPage() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: ColorService.black),
      child: Column(children: [_buildLogo(), _buildIntroduction(), _buildButton()]),
    );
  }

  Widget _buildLogo() {
    return SizedBox(
      width: 90,
      height: 90,
      child: Image.asset(
        "assets/images/logo.png",
        fit: BoxFit.contain,
        color: ColorService.pink,
      ),
    );
  }

  Widget _buildIntroduction() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 200,
      margin: EdgeInsets.all(containerMargin),
      padding: EdgeInsets.all(containerPadding),
      decoration: BoxDecoration(color: ColorService.pink, borderRadius: BorderRadius.circular(20)),
      child: Column(children: [_buildIntroductionTitle(), _buildIntroductionSubTitle(), _buildIntroductionContent()]),
    );
  }

  Widget _buildButton() {
    return SizedBox(
      height: 40.0,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 40.0,
            width: 40.0,
          ),
          SizedBox(
            height: 40.0,
            width: 40.0,
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: ColorService.pink,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntroductionTitle() {
    return Text(title, style: TextStyle(color: ColorService.black, fontSize: titleFontSize));
  }

  Widget _buildIntroductionSubTitle() {
    return Text(subTitle, style: TextStyle(color: ColorService.black, fontSize: subTitleFontSize));
  }

  Widget _buildIntroductionContent() {
    return Text(content, style: TextStyle(color: ColorService.black, fontSize: contentFontSize));
  }

  void _goToHomePage() async {
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const HomePage(),
      ),
    );
  }
}
