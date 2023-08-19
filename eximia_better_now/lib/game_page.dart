import 'package:auto_size_text/auto_size_text.dart';
import 'package:eximia_better_now/color_service.dart';
import 'package:eximia_better_now/game_service.dart';
import 'package:eximia_better_now/game_model.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import 'package:flutter/material.dart';

import 'game_selection_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double titleFontSize = 20.0;
  double contentFontSize = 16.0;

  double containerBorderRadius = 20.0;
  double containerMargin = 20.0;
  double containerPadding = 20.0;

  int currentStep = 0;

  FlipCardController flipCardController = FlipCardController();
  CountDownController countdownController = CountDownController();

  bool timerActive = false;
  bool trueCard = true;

  @override
  void initState() {
    super.initState();
  }

  void startTimer() async {
    await Future.delayed(const Duration(seconds: 1), () {});
    countdownController.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentStep == 0 ? _buildGameIntroductionPage() : _buildGamePage(),
    );
  }

  Widget _buildGamePage() {
    CardModel currentCard = GameService.selectedGame.deck!.cards[currentStep > 0 ? currentStep - 1 : 0];

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: ColorService.pink),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [_buildGameAlternativeCardPage(currentCard)]),
    );
  }

  Widget _buildDeck() {
    CardModel currentCard = GameService.selectedGame.deck!.cards[currentStep > 0 ? currentStep - 1 : 0];

    return Container(
      child: _buildAlternativeCard(currentCard),
    );
  }

  Widget _buildCard() {
    CardModel currentCard = GameService.selectedGame.deck!.cards[currentStep > 0 ? currentStep - 1 : 0];
    return trueCard
        ? FlipCard(
            controller: flipCardController,
            direction: FlipDirection.HORIZONTAL,
            side: CardSide.BACK,
            autoFlipDuration: const Duration(seconds: 2),
            speed: 1000,
            onFlipDone: (status) {
              print(status);
            },
            front: _buildCardContent(
                GameService.selectedGame.title, currentCard.content, currentCard.number, currentCard.imagePath),
            back: _buildCardContent(null, null, 0, null))
        : _buildGameAlternativeCardPage(currentCard);
  }

  Widget _buildCardContent(String? title, String? content, int number, String? imagePath) {
    bool isBackground = title == null && content == null;

    return Container(
      margin: const EdgeInsets.only(left: 40, right: 40, top: 100),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.7,
      decoration: BoxDecoration(
          color: isBackground ? GameService.selectedGame.backgroundColor! : ColorService.darkGrey,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: ColorService.black, width: 5.0),
          image: DecorationImage(
              image: const AssetImage("assets/images/dark_card_background.png"),
              fit: BoxFit.cover,
              opacity: (isBackground ? 0.0 : 1.0))),
      child: Column(
        mainAxisAlignment: isBackground ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
        children: [
          isBackground ? _buildLogo(GameService.selectedGame.foregroundColor!, noMargin: true) : Container(),
          isBackground ? Container() : _buildCardContentSection(title, content, imagePath),
          isBackground ? Container() : _buildCardNumber(number),
        ],
      ),
    );
  }

  Widget _buildCardContentSection(String? title, String? content, String? imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        title != null ? _buildCardLogo() : Container(),
        title != null ? _buildGameTitle() : Container(),
        _buildCardText(content),
      ],
    );
  }

  Widget _buildCardImage(String path) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      width: 121,
      height: 121,
      decoration: BoxDecoration(color: ColorService.grey, borderRadius: BorderRadius.circular(20)),
      child: Image.asset(
        "assets/images/" + path,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildCardLogo() {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 2.0,
              width: MediaQuery.of(context).size.width / 5,
              decoration: BoxDecoration(color: ColorService.pink)),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            width: 60,
            height: 60,
            child: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.contain,
              color: ColorService.pink,
            ),
          ),
          Container(
              height: 2.0,
              width: MediaQuery.of(context).size.width / 5,
              decoration: BoxDecoration(color: ColorService.pink)),
        ],
      ),
    );
  }

  Widget _buildCardText(String? text) {
    return text == null
        ? Container()
        : Container(
            margin: EdgeInsets.all(containerMargin),
            padding: EdgeInsets.all(containerPadding),
            decoration: BoxDecoration(color: ColorService.grey, borderRadius: BorderRadius.circular(20)),
            child: Container(
                margin: EdgeInsets.only(bottom: containerMargin),
                child: AutoSizeText(
                  text,
                  style: TextStyle(
                    color: ColorService.lightTextColor,
                  ),
                  minFontSize: 14,
                  maxFontSize: 22,
                  textAlign: TextAlign.center,
                )),
          );
  }

  Widget _buildCardNumber(int number) {
    return Container(
      height: 40,
      width: 40,
      padding: const EdgeInsets.only(top: 4),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(shape: BoxShape.circle, color: ColorService.grey),
      child: Container(
          padding: const EdgeInsets.all(5),
          child: Text(
            number.toString(),
            style: TextStyle(
              color: ColorService.lightTextColor,
              fontSize: contentFontSize,
            ),
            textAlign: TextAlign.center,
          )),
    );
  }

  Widget _buildGameControls() {
    CardModel currentCard = GameService.selectedGame.deck!.cards[currentStep > 0 ? currentStep - 1 : 0];

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildRestartButton(), _buildTimer(), _buildNextButton()],
      ),
    );
  }

  Widget _buildRestartButton() {
    CardModel currentCard = GameService.selectedGame.deck!.cards[currentStep > 0 ? currentStep - 1 : 0];

    return AnimatedOpacity(
      opacity: timerActive && currentCard.imagePath == null ? 0.3 : 1.0,
      duration: const Duration(milliseconds: 200),
      child: GestureDetector(
        onTap: () {
          if (!timerActive || currentCard.imagePath != null) {
            if (GameService.selectedGame.deck!.cards.length == currentStep) {
              _goToGameSelectionPage();
            }
            _resetSteps();
          }
        },
        child: Container(
            height: 60.0,
            width: 60.0,
            margin: EdgeInsets.symmetric(vertical: containerMargin),
            decoration: BoxDecoration(shape: BoxShape.circle, color: ColorService.black, boxShadow: [
              BoxShadow(
                  color: ColorService.darkPink, blurRadius: 2.0, spreadRadius: 2.0, offset: const Offset(2.0, 2.0))
            ]),
            child: Center(
              child: Icon(
                Icons.restart_alt_rounded,
                size: 30,
                color: ColorService.pink,
              ),
            )),
      ),
    );
  }

  Widget _buildTimer() {
    CardModel currentCard = GameService.selectedGame.deck!.cards[currentStep > 0 ? currentStep - 1 : 0];

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: timerActive && currentCard.imagePath == null ? 1.0 : 0.1,
      child: SizedBox(
        height: 121,
        child: CircularCountDownTimer(
          duration: 5,
          initialDuration: 0,
          controller: countdownController,
          width: 40,
          height: 40,
          ringColor: ColorService.darkPink.withOpacity(0.3),
          fillColor: ColorService.pink,
          strokeWidth: 4.0,
          strokeCap: StrokeCap.round,
          isReverse: true,
          isReverseAnimation: false,
          isTimerTextShown: false,
          autoStart: true,
          onStart: () {
            timerActive = true;
          },
          onComplete: () {
            setState(() {
              timerActive = false;
            });
          },
        ),
      ),
    );
  }

  Widget _buildGameIntroductionPage() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: ColorService.lightBlack),
      child: Column(children: [_buildLogo(ColorService.pink), _buildGameTitle(), _buildIntroduction()]),
    );
  }

  Widget _buildGameAlternativeCardPage(CardModel card) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: ColorService.darkGrey,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: ColorService.black, width: 5.0),
          image: const DecorationImage(
            image: AssetImage("assets/images/dark_card_background.png"),
            fit: BoxFit.cover,
          )),
      child: Column(children: [_buildLogo(ColorService.pink), _buildGameTitle(), _buildAlternativeCard(card)]),
    );
  }

  Widget _buildAlternativeCard(CardModel card) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(containerMargin),
        padding: EdgeInsets.all(containerPadding),
        decoration: BoxDecoration(color: ColorService.black, borderRadius: BorderRadius.circular(20)),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const SizedBox(
            height: 1,
            width: 1,
          ),
          _buildCardContentAlternative(card.content, card.imagePath),
          _buildGameControls()
        ]),
      ),
    );
  }

  Widget _buildLogo(Color logoColor, {bool noMargin = false}) {
    return Container(
      margin: noMargin ? null : const EdgeInsets.only(top: 80, bottom: 20),
      width: 90,
      height: 90,
      child: Image.asset(
        "assets/images/logo.png",
        fit: BoxFit.contain,
        color: logoColor,
      ),
    );
  }

  Widget _buildIntroduction() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 320,
      margin: EdgeInsets.all(containerMargin),
      padding: EdgeInsets.all(containerPadding),
      decoration: BoxDecoration(color: ColorService.black, borderRadius: BorderRadius.circular(20)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const SizedBox(height:20), _buildGameIntroduction(), _buildNextButton()]),
    );
  }

  Widget _buildGameTitle() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: containerMargin),
        decoration: BoxDecoration(
            color: GameService.selectedGame.id == 0
                ? ColorService.black
                : GameService.selectedGame.id == 1
                    ? ColorService.pink
                    : ColorService.yellow,
            borderRadius: BorderRadius.circular(30.0)),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Text(GameService.selectedGame.title!,
            style: TextStyle(
              color: GameService.selectedGame.titleTextColor,
              fontSize: titleFontSize,
              fontWeight: FontWeight.w800,
            )));
  }

  Widget _buildGameIntroduction() {
    return Container(
        margin: EdgeInsets.only(bottom: containerMargin),
        child: AutoSizeText(
          GameService.selectedGame.introduction!,
          minFontSize: 18,
          maxFontSize: 24,
          style: TextStyle(
            color: ColorService.lightTextColor,
          ),
          textAlign: TextAlign.center,
        ));
  }

  Widget _buildCardContentAlternative(String content, String? image) {
    return Container(
        margin: EdgeInsets.only(bottom: containerMargin),
        child: Column(
          children: [
            AutoSizeText(
              content,
              minFontSize: 18,
              maxFontSize: 28,
              style: TextStyle(
                color: ColorService.lightTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            image != null ? Container(
              margin: const EdgeInsets.only(top: 30),
              child: _buildCardImage(image)) : Container()
          ],
        ));
  }

  Widget _buildNextButton() {
    CardModel currentCard = GameService.selectedGame.deck!.cards[currentStep > 0 ? currentStep - 1 : 0];

    if (currentCard.imagePath != null) {
      timerActive = false;
    }

    bool nextActive =
        (!timerActive || currentCard.imagePath != null) && currentStep < GameService.selectedGame.deck!.cards.length;

    return AnimatedOpacity(
      opacity: nextActive ? 1.0 : 0.3,
      duration: const Duration(milliseconds: 200),
      child: GestureDetector(
        onTap: () {
          if (nextActive) {
            _addStep();
          }
        },
        child: Container(
            height: 60.0,
            width: 60.0,
            margin: EdgeInsets.symmetric(vertical: containerMargin),
            decoration: BoxDecoration(shape: BoxShape.circle, color: ColorService.black, boxShadow: [
              BoxShadow(
                  color: ColorService.darkPink, blurRadius: 2.0, spreadRadius: 2.0, offset: const Offset(2.0, 2.0))
            ]),
            child: Center(
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 30,
                color: ColorService.pink,
              ),
            )),
      ),
    );
  }

  void _addStep() {
    setState(() {
      if (GameService.selectedGame.deck!.cards.length > currentStep) {
        if (currentStep > 0) {
          countdownController.restart();
        } else {
          timerActive = true;
        }
        currentStep++;
        _animateCard();
      }
    });
  }

  void _animateCard() async {
    flipCardController.toggleCardWithoutAnimation();
    await Future.delayed(const Duration(seconds: 2), () {});
    flipCardController.toggleCard();
  }

  void _resetSteps() {
    setState(() {
      flipCardController.toggleCardWithoutAnimation();
      currentStep = 0;
      _goToGameSelectionPage();
    });
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
