import 'package:card_wallet/providers/card_provider.dart';
import 'package:card_wallet/ui/widgets/card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Wallet',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.black,
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: ChangeNotifierProvider(
        builder: (_) => CardProvider(),
        child: CardList(),
      ),
    );
  }
}
