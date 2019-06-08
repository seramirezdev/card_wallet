import 'package:card_wallet/models/card_model.dart';
import 'package:card_wallet/providers/card_provider.dart';
import 'package:card_wallet/ui/widgets/card_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);

    final _screenSize = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        cardProvider.cardList.isEmpty
            ? CircularProgressIndicator()
            : SizedBox(
                height: _screenSize.height * 0.8,
                child: Swiper(
                    itemCount: cardProvider.cardList.length,
                    layout: SwiperLayout.STACK,
                    scrollDirection: Axis.vertical,
                    itemWidth: _screenSize.width * 0.6,
                    itemHeight: _screenSize.height * 0.55,
                    itemBuilder: (_, index) {
                      return CardWidget(
                        card: cardProvider.cardList[index],
                      );
                    }),
              ),
      ],
    );
  }
}

class CardWidget extends StatelessWidget {
  final CardModel card;

  final double paddingHorizontal = 30.0;
  final double paddingVertical = 25.0;

  CardWidget({this.card});

  @override
  Widget build(BuildContext context) {
    final cardLogo = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Image(
          image: AssetImage('assets/visa_logo.png'),
          width: 65.0,
          height: 32.0,
        ),
        Text(
          card.type,
          style: TextStyle(
              color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w400),
        )
      ],
    );

    final cardChip = CardChip();

    final cardNumber = Container(
      padding: EdgeInsets.only(top: 15.0),
      child: _buildDots(),
    );

    String lastNumber = card.number.toString().substring(12);

    final cardLastNumber = Padding(
      padding: EdgeInsets.only(left: 3.0),
      child: Text(
        lastNumber,
        style: TextStyle(color: Colors.white, fontSize: 8.0),
      ),
    );

    final cardValidThru = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              'valid',
              style: TextStyle(color: Colors.white, fontSize: 8.0),
            ),
            Text(
              'thru',
              style: TextStyle(color: Colors.white, fontSize: 8.0),
            ),
          ],
        ),
        SizedBox(width: 5.0),
        Text("${card.month}/${card.year.toString().substring(2)}",
            style: TextStyle(color: Colors.white, fontSize: 16.0))
      ],
    );

    final cardOwner = Padding(
      padding: EdgeInsets.only(top: 5.0),
      child: Text(
        card.holderName.toUpperCase(),
        style: TextStyle(color: Colors.white, fontSize: 18.0),
      ),
    );

    return Container(
      decoration: BoxDecoration(
          color: card.color, borderRadius: BorderRadius.circular(15.0)),
      child: RotatedBox(
        quarterTurns: 3,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal,
            vertical: paddingVertical,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              cardLogo,
              cardChip,
              cardNumber,
              cardLastNumber,
              cardValidThru,
              cardOwner,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDots() {
    List<Widget> dotList = List();

    final dot = Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      child: Container(
        width: 6.0,
        height: 6.0,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );

    final dots = Row(
      children: <Widget>[dot, dot, dot, dot],
    );

    for (int i = 0; i < 3; i++) {
      final containerDots = Container(
        child: dots,
      );

      dotList.add(containerDots);
    }

    // Add numbers to final
    final numbers = Text(
      card.number.toString().substring(12),
      style: TextStyle(color: Colors.white),
    );

    dotList.add(numbers);

    return Row(
      children: dotList,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
