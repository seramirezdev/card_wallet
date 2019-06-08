import 'package:card_wallet/ui/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(CardWalletApp());

class CardWalletApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      title: "Card Wallet BLoC",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
