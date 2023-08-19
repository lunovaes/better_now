import 'package:auto_size_text/auto_size_text.dart';
import 'package:eximia_better_now/color_service.dart';
import 'package:eximia_better_now/game_page.dart';
import 'package:eximia_better_now/game_selection_page.dart';
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
      "O jogo tem o objetivo de \nproporcionar uma experiência \ndiferenciada e profunda entre vocês! \nSão 3 categorias de cartas: \nConecte-se, Prepare-se e Inspire-se! \nRecomendamos que sigam a ordem \ndas cartas das primeiras duas \ncategorias e utilize a última quando \nquiserem se inspirar";

  double titleFontSize = 28.0;
  double subTitleFontSize = 26.0;
  double contentFontSize = 20.0;

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
      child: Column(children: [_buildLogo(), _buildIntroductionTitle(), _buildIntroduction()]),
    );
  }

  Widget _buildLogo() {
    return Container(
      margin: const EdgeInsets.only(top: 80, bottom: 20),
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
      height: MediaQuery.of(context).size.height - 320,
      margin: EdgeInsets.all(containerMargin),
      padding: EdgeInsets.all(containerPadding),
      decoration: BoxDecoration(color: ColorService.lightBlack, borderRadius: BorderRadius.circular(20)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_buildIntroductionSubTitle(), _buildIntroductionContent(), _buildNextButton()]),
    );
  }

  Widget _buildButton() {
    return SizedBox(
      height: 40.0,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
    return Container(
        margin: EdgeInsets.symmetric(vertical: containerMargin),
        child: AutoSizeText(title,
        minFontSize: 18,
        maxFontSize: titleFontSize,
            style: TextStyle(
              color: ColorService.lightTextColor,
              fontSize: titleFontSize,
              fontWeight: FontWeight.w900,
            )));
  }

  Widget _buildIntroductionSubTitle() {
    return Container(
        margin: EdgeInsets.only(bottom: containerMargin),
        child: AutoSizeText(subTitle,
            minFontSize: 14,
            maxFontSize: subTitleFontSize,
            style: TextStyle(color: ColorService.lightTextColor),
            textAlign: TextAlign.center));
  }

  Widget _buildIntroductionContent() {
    return Container(
        margin: EdgeInsets.only(bottom: containerMargin),
        child: AutoSizeText(
          content,
          minFontSize: 14,
          maxFontSize: contentFontSize,
          style: TextStyle(
            color: ColorService.lightTextColor,
          ),
          textAlign: TextAlign.center,
        ));
  }

  Widget _buildNextButton() {
    return GestureDetector(
      onTap: () {
        _goToGameSelectionPage();
      },
      child: Container(
          height: 60.0,
          width: 60.0,
          margin: EdgeInsets.symmetric(vertical: containerMargin),
          decoration: BoxDecoration(shape: BoxShape.circle, color: ColorService.black, boxShadow: [
            BoxShadow(color: ColorService.darkPink, blurRadius: 2.0, spreadRadius: 2.0, offset: const Offset(2.0, 2.0))
          ]),
          child: Center(
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 30,
              color: ColorService.pink,
            ),
          )),
    );
  }

  void _goToGameSelectionPage() async {
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const GameSelectionPage(),
      ),
    );
  }
}
