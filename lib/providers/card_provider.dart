import 'dart:convert';

import 'package:card_wallet/helpers/card_colors.dart';
import 'package:card_wallet/models/card_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

class CardProvider with ChangeNotifier {

  List<CardModel> _cardList;

  List<CardModel> get cardList => _cardList;

  CardProvider() {
    _cardList = [];
    initialData();
  }

  void initialData() async {
    String data = await rootBundle.loadString('data/initialData.json');
    Map json = jsonDecode(data);
    _cardList = List<CardModel>();

    if (json["cardResults"] != null) {
      json["cardResults"].forEach((card) {
        _cardList.add(new CardModel.fromJson(card));
      });

      _cardList.asMap().forEach((index, card) {
        card.color = CardColors.baseColors[index];
      });

      print(_cardList);
      notifyListeners();
    }
  }
}
