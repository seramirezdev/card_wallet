import 'package:card_wallet/models/card_color_model.dart';
import 'package:flutter/material.dart';

class CardColors {
  static const baseColors = <Color>[
    Color.fromRGBO(61, 132, 223, 1.0), // lightBlue
    Color.fromRGBO(114, 71, 200, 1.0), // purle
    Color.fromRGBO(106, 188, 121, 1.0), // green
    Color.fromRGBO(229, 92, 131, 1.0), // pink
    Color.fromRGBO(96, 200, 227, 1.0), // cyan
    Color.fromRGBO(219, 157, 80, 1.0), // orange
    Color.fromRGBO(60, 61, 63, 1.0), // black
    Color.fromRGBO(222, 88, 116, 1.0), // salmon
    Color.fromRGBO(128, 182, 234, 1.0), // lightCyan
  ];

  static List<CardColorModel> cardColors = List.generate(
      baseColors.length,
      (int index) => CardColorModel(isSelected: false, cardColor: index));
}
