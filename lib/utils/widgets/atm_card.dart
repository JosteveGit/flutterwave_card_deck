import 'package:flutter/material.dart';

class ATMCARD extends StatefulWidget {
  final ATMCardAnimationDetails animationDetails;
  final ATMCardUIDetails atmCardUIDetails;
  const ATMCARD({
    Key key,
    @required this.animationDetails,
    @required this.atmCardUIDetails,
  }) : super(key: key);

  @override
  _ATMCARDState createState() => _ATMCARDState();
}

class _ATMCARDState extends State<ATMCARD> {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(
        (widget.animationDetails.index * -20.0),
        widget.animationDetails.move * 30.0,
      ),
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.0008)
          ..rotateY(widget.animationDetails.rotateY ?? 0.5)
          ..rotateX(widget.animationDetails.rotateX ?? -0.8)
          ..rotateZ(0.1)
          ..translate(20.0, widget.animationDetails.translateY ?? 0.0, 0.0),
        child: Container(
          width: 450,
          height: 280,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                widget.atmCardUIDetails.cardIcon ?? Icons.masks_rounded,
                color: Colors.white,
                size: 60,
              ),
              Transform.translate(
                offset: Offset(0, -2),
                child: Text(
                  "${widget.atmCardUIDetails.cardName ?? "Mask"} Card",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              Text(
                (widget.atmCardUIDetails.cardPan ?? "1234567890181234").replaceAllMapped(
                    RegExp(r".{4}"), (match) => "${match.group(0)}       "),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "VALID\nTRU",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "10/21",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          widget.atmCardUIDetails.cardOwner?.toUpperCase() ?? "JOSTEVE ADEKANBI",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/mastercardlogo.png",
                    height: 30,
                  )
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: widget.atmCardUIDetails.gradientColors,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 1.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ATMCardAnimationDetails {
  final double rotateX, rotateY, translateY, int, index, move;

  ATMCardAnimationDetails(
      {this.rotateX,
      this.rotateY,
      this.translateY,
      this.int,
      this.index,
      this.move});
}

class ATMCardUIDetails {
  final List<Color> gradientColors;
  final String cardName;
  final IconData cardIcon;
  final String cardOwner;
  final String cardPan;
  final String validThru;

  ATMCardUIDetails(
      {this.gradientColors,
      this.cardName,
      this.cardIcon,
      this.cardOwner,
      this.cardPan,
      this.validThru});
}
