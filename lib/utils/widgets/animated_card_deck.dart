import 'package:flutter/material.dart';
import 'package:flutterwave_card_deck/utils/functions/animation_utils.dart';
import 'package:flutterwave_card_deck/utils/widgets/atm_card.dart';
import 'package:flutterwave_card_deck/utils/widgets/two_animated_builders.dart';

class AnimatedCardDeck extends StatelessWidget {
  const AnimatedCardDeck({
    Key key,
    @required Animation moveController,
    @required Animation shiftController,
    @required this.isOut,
    @required this.cardsDetailsList,
  })  : _moveController = moveController,
        _shiftController = shiftController,
        super(key: key);

  final Animation _moveController;
  final Animation _shiftController;
  final bool isOut;
  final List<ATMCardUIDetails> cardsDetailsList;

  @override
  Widget build(BuildContext context) {
    int numberOfCards = cardsDetailsList.length;
    return TwoAninmatedBuilders(
      animations: [_moveController, _shiftController],
      builder: () {
        return Stack(
          children: List.generate(
            numberOfCards + 1,
            (index) {
              double multiplier = (numberOfCards + 1) - index.toDouble();
              return Builder(
                builder: (context) {
                  var yRotate = getAnimValue(
                      start: 0.5, end: 0.6, animation: _moveController);
                  var xRotate = getAnimValue(
                      start: -0.8, end: -0.1, animation: _moveController);
                  var yTranslate = -300 * _moveController.value;

                  //TOP CARD.
                  var topCardAnimDetails = ATMCardAnimationDetails(
                    move: multiplier,
                    rotateX: xRotate,
                    rotateY: yRotate,
                    translateY: yTranslate,
                    index: index.toDouble(),
                  );
                  if (index == numberOfCards) {
                    return Opacity(
                      opacity: isOut ? 0 : 1,
                      child: ATMCARD(
                        animationDetails: topCardAnimDetails,
                        atmCardUIDetails: cardsDetailsList.first,
                      ),
                    );
                  }

                  //3d EFFECT CARD.
                  //Index starts at 0 and ends at number of cards
                  //Move starts at multiplier * 1.0 but ends at (n)
                  double moveEnd =
                      (numberOfCards + 1) - numberOfCards.toDouble();
                  double moveStart = multiplier;
                  var _3DEffectCardAnimDetails = ATMCardAnimationDetails(
                    move: isOut
                        ? getAnimValue(
                            animation: _moveController,
                            start: (numberOfCards + 1) - 1.0,
                            end: moveEnd)
                        : getAnimValue(
                            start: moveStart,
                            end: moveEnd,
                            animation: _moveController,
                          ),
                    index: isOut
                        ? getAnimValue(
                            start: 1.0,
                            end: numberOfCards.toDouble(),
                            animation: _moveController,
                          )
                        : numberOfCards * _moveController.value,
                    rotateX: xRotate,
                    rotateY: yRotate,
                    translateY: yTranslate,
                  );
                  if (index == 0) {
                    return Opacity(
                      opacity: isOut ? 1 : 0,
                      child: ATMCARD(
                        animationDetails: _3DEffectCardAnimDetails,
                        atmCardUIDetails: cardsDetailsList.first,
                      ),
                    );
                  }

                  //OTHER CARDS.
                  var otherCardAnimDetails = ATMCardAnimationDetails(
                    move: getAnimValue(
                      start: multiplier,
                      end: (numberOfCards + 1) - (index.toDouble() + 1),
                      animation: _shiftController,
                    ),
                    index: getAnimValue(
                      start: index.toDouble(),
                      end: index.toDouble() + 1,
                      animation: _shiftController,
                    ),
                  );
                  List<ATMCardUIDetails> leftDetails = [];
                  for (int i = cardsDetailsList.length - 1; i > 0; i--) {
                    leftDetails.add(cardsDetailsList[i]);
                  }
                  return ATMCARD(
                    animationDetails: otherCardAnimDetails,
                    atmCardUIDetails: leftDetails[index - 1],
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
