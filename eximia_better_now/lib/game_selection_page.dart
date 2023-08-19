import 'package:eximia_better_now/color_service.dart';
import 'package:eximia_better_now/game_model.dart';
import 'package:eximia_better_now/game_page.dart';
import 'package:eximia_better_now/game_service.dart';
import 'package:flutter/material.dart';

class GameSelectionPage extends StatefulWidget {
  const GameSelectionPage({Key? key}) : super(key: key);
  @override
  State<GameSelectionPage> createState() => _GameSelectionPageState();
}

class _GameSelectionPageState extends State<GameSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildGameSelectionPage(),
    );
  }

  Widget _buildGameSelectionPage() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(color: ColorService.lightBlack),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildGameButton(GameService.games[0]),
          _buildGameButton(GameService.games[1]),
          _buildGameButton(GameService.games[2])
        ],
      ),
    );
  }

  Widget _buildGameButton(GameModel game) {
    return GestureDetector(
      onTap: () {
        _goToGame(game);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Column(children: [
          _buildGameTitle(game.title!, game.titleBackgroundColor!, game.titleTextColor!),
          _buildLogo(game.id == 2 ? ColorService.pink : game.foregroundColor!, (game.id == 2 ? ColorService.yellow : game.backgroundColor!))
        ]),
      ),
    );
  }

  Widget _buildGameTitle(String title, Color backgroundColor, Color titleColor) {
    return Container(
        decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(30.0)),
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Text(title,
            style: TextStyle(
              color: titleColor,
              fontSize: 22.0,
              fontWeight: FontWeight.w800,
            )));
  }

  Widget _buildLogo(Color logoColor, Color backgroundColor) {
    return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(shape: BoxShape.circle, color: backgroundColor, boxShadow: [
          BoxShadow(color: ColorService.black, blurRadius: 2.0, spreadRadius: 2.0, offset: const Offset(2.0, 2.0))
        ]),
        child: Center(
          child: SizedBox(
              width: 70,
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.contain,
                color: logoColor,
              )),
        ));
  }

  void _goToGame(GameModel game) {
    setState(() {
      GameService.selectedGame = game;
      _startGame();
    });
  }

  void _startGame() {
    _goToGamePage();
  }

  void _goToGamePage() async {
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const GamePage(),
      ),
    );
  }
}
