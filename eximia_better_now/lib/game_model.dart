import 'dart:ui';

import 'package:eximia_better_now/color_service.dart';

class GameModel {
  int? id;
  String? title;
  String? introduction;
  String? additionalInformation;
  DeckModel? deck;
  Color? backgroundColor;
  Color? foregroundColor;
  Color? titleBackgroundColor;
  Color? titleTextColor = ColorService.darkTextColor;
  bool hasTimer = true;
}

class DeckModel {
  DeckModel(this.cards);
  List<CardModel> cards;
}

class CardModel {
  CardModel(this.number, this.content, {this.imagePath});

  int number;
  String content;
  String? imagePath;
}
