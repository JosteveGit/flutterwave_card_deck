import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterwave_card_deck/utils/widgets/animated_card_deck.dart';
import 'package:flutterwave_card_deck/utils/widgets/atm_card.dart';

class PlaygroundPage extends StatefulWidget {
  @override
  _PlaygroundPageState createState() => _PlaygroundPageState();
}

class _PlaygroundPageState extends State<PlaygroundPage>
    with TickerProviderStateMixin {
  List<ATMCardUIDetails> cardsDetailsList = [
    ATMCardUIDetails(
      cardIcon: CupertinoIcons.money_dollar_circle,
      gradientColors: [Colors.indigo, Colors.purple],
      cardName: "Dollar",
      cardOwner: "TIM SNEATH",
      cardPan: "1010967890181234",
    ),
    ATMCardUIDetails(
      cardIcon: CupertinoIcons.money_pound_circle,
      gradientColors: [Colors.red, Colors.blue[700]],
      cardName: "Pound",
      cardOwner: "TIMILEHIN JEGEDE",
      cardPan: "1010967900181112",
    ),
    ATMCardUIDetails(
      gradientColors: [Colors.pink, Colors.lime],
      cardName: "Bitcoin",
      cardIcon: CupertinoIcons.bitcoin_circle,
      cardOwner: "LETS4R",
      cardPan: "1010102412346789",
    ),
    ATMCardUIDetails(
      cardIcon: CupertinoIcons.money_euro_circle,
      cardName: "Euro",
      gradientColors: [
        Colors.green,
        Colors.cyan[700],
      ],
      cardOwner: "CHIZIARUHOMA OGBONDA",
      cardPan: "1010113567390789",
    ),
    ATMCardUIDetails(
      cardIcon: CupertinoIcons.money_yen_circle,
      cardName: "Yen",
      gradientColors: [Colors.blueGrey, Colors.brown],
      cardPan: "1010345790908867",
    ),
    ATMCardUIDetails(
        cardIcon: CupertinoIcons.money_yen_circle,
        cardName: "Yen",
        gradientColors: [Colors.orange, Colors.indigoAccent],
        cardPan: "1010345790908867",
        cardOwner: "WILSON WILSON"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedCardDeck(
          cardsDetailsList: cardsDetailsList,
          size: MediaQuery.of(context).size.width / 4.5,
        ),
      ),
    );
  }
}
