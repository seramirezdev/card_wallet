import 'package:flutter/material.dart';

class CardChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, left: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage('assets/credit_card_chip_silver.png'),
            width: 50.0,
          ),
        ],
      ),
    );
  }
}
