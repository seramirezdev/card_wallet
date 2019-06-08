import 'package:card_wallet/helpers/card_colors.dart';
import 'package:card_wallet/models/card_color_model.dart';

class CardProvider {
  String holderName;
  String number;
  String month;
  String type;
  int year;
  int cvv;
  int colorIndexSelected;
  List<CardColorModel> cardColorsList;

  CardProvider(
      {this.holderName,
      this.number,
      this.month,
      this.type,
      this.year,
      this.cvv,
      this.colorIndexSelected,
      this.cardColorsList});

  factory CardProvider.initialData() {
    return CardProvider(
        holderName: "",
        number: "",
        month: "",
        type: "",
        year: 0,
        cvv: 0,
        colorIndexSelected: 0,
        cardColorsList: []);
  }

  void selectCardColor(int colorIndex) {
    CardColors.cardColors.forEach((e) => e.isSelected = false);
    CardColors.cardColors[colorIndex].isSelected = true;
    cardColorsList = CardColors.cardColors;
    colorIndexSelected = colorIndex;
  }
}
