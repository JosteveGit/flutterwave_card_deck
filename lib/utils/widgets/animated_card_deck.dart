import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterwave_card_deck/utils/functions/animation_utils.dart';
import 'package:flutterwave_card_deck/utils/widgets/two_animated_builders.dart';

import 'atm_card.dart';

class AnimatedCardDeck extends StatefulWidget {
  const AnimatedCardDeck({
    Key key,
    @required this.cardsDetailsList,
    this.scale, this.size,
  }) : super(key: key);

  final List<ATMCardUIDetails> cardsDetailsList;
  final double scale;
  final double size;

  @override
  _AnimatedCardDeckState createState() => _AnimatedCardDeckState();
}

class _AnimatedCardDeckState extends State<AnimatedCardDeck>
    with TickerProviderStateMixin {
  AnimationController _moveController;
  AnimationController _shiftController;

  CurvedAnimation curvedAnimation;

  bool isOut = false;

  @override
  void initState() {
    _shiftController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _moveController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    curvedAnimation =
        CurvedAnimation(parent: _moveController, curve: Curves.easeInOut);
    super.initState();
    Timer.periodic(Duration(milliseconds: 3000), (timer) async {
      if (!_moveController.toStringDetails().contains("DISPOSED")) {
        await animate();
      }
    });
  }

  Future<void> animate() async {
    await _moveController.forward();
    setState(() {
      isOut = true;
    });
    _moveController.reverse();
    await Future.delayed(Duration(milliseconds: 300));
    _shiftController.forward();
    await Future.delayed(Duration(seconds: 1));
    _shiftController.reset();
    setState(() {
      isOut = false;
      //Throw the first item to the end of the list
      widget.cardsDetailsList.add(widget.cardsDetailsList.removeAt(0));
    });
  }

  @override
  void dispose() {
    _moveController.dispose();
    _shiftController.dispose();
    super.dispose();
  }

  @override
  build(BuildContext context) {
    int numberOfCards = widget.cardsDetailsList.length;
    return Container(
      width:  widget.size ?? 150,
      height: widget.size ?? 150,
      child: FittedBox(
        child: TwoAnimatedBuilders(
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
                          child: ATMCard(
                            animationDetails: topCardAnimDetails,
                            atmCardUIDetails: widget.cardsDetailsList.first,
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
                          child: ATMCard(
                            animationDetails: _3DEffectCardAnimDetails,
                            atmCardUIDetails: widget.cardsDetailsList.first,
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
                      for (int i = widget.cardsDetailsList.length - 1;
                          i > 0;
                          i--) {
                        leftDetails.add(widget.cardsDetailsList[i]);
                      }
                      return ATMCard(
                        animationDetails: otherCardAnimDetails,
                        atmCardUIDetails: leftDetails[index - 1],
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
