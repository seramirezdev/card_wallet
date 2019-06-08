import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CardModel {
  String holderName, type, number, month;
  int year, cvv;
  Color color;

  CardModel(
      {@required this.holderName,
      @required this.number,
      @required this.month,
      @required this.year,
      @required this.cvv,
      @required this.color,
      @required this.type});

  CardModel.fromJson(Map<String, dynamic> json)
      : holderName = json['holderName'],
        number = json['number'],
        month = json['month'],
        year = json['year'].toInt(),
        cvv = json['cvv'].toInt(),
        type = json['type'];
}
