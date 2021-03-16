<!--Some days back, I implemented the Flutterwave's animated card deck from [Flutterwave's landing page](https://flutterwave.com).-->

<!--I shared it on Twitter and thought it'd be a nice idea to write an article on how I implemented it.-->

<!--%[https://www.twitter.com/jostevee/status/1367811531388444677?s=20]-->

<!--So, here it is.-->

<!--We'll be using 3 main widgets: Stack, AnimatedBuilder and Transform.-->

<!--## Set up the flutter project-->

<!--Create a new Flutter project.-->

<!-->flutter create flutterwave_card_deck-->

<!--Open the project using your preferred IDE.-->

<!--## Creating the Card-->

<!--```-->
<!--import 'package:flutter/material.dart';-->

<!--void main() {-->
<!--  runApp(MyApp());-->
<!--}-->

<!--class MyApp extends StatelessWidget {-->
<!--  @override-->
<!--  Widget build(BuildContext context) {-->
<!--    return MaterialApp(-->
<!--      title: 'Flutter Demo',-->
<!--      debugShowCheckedModeBanner: false,-->
<!--      theme: ThemeData(-->
<!--        primarySwatch: Colors.blue,-->
<!--        fontFamily: 'Montserrat'-->
<!--      ),-->
<!--      home: Home(),-->
<!--    );-->
<!--  }-->
<!--}-->

<!--class Home extends StatefulWidget {-->
<!--  @override-->
<!--  _HomeState createState() => _HomeState();-->
<!--}-->

<!--class _HomeState extends State<Home> {-->
<!--  @override-->
<!--  Widget build(BuildContext context) {-->
<!--    return Scaffold(-->
<!--      backgroundColor: Colors.black,-->
<!--      body: Center(-->
<!--        child: Container(-->
<!--          width: 450,-->
<!--          height: 280,-->
<!--          padding: cardPadding,-->
<!--          child: Column(-->
<!--            crossAxisAlignment: CrossAxisAlignment.start,-->
<!--            children: [-->
<!--              Icon(-->
<!--               Icons.masks_rounded,-->
<!--                color: Colors.white,-->
<!--                size: 60,-->
<!--              ),-->
<!--              Transform.translate(-->
<!--                offset: Offset(0, -2),-->
<!--                child: Text(-->
<!--                  "Flutter Card",-->
<!--                  style: TextStyle(-->
<!--                    color: Colors.white,-->
<!--                    fontWeight: FontWeight.bold,-->
<!--                  ),-->
<!--                ),-->
<!--              ),-->
<!--              Spacer(),-->
<!--              Text(-->
<!--                getCardPan,-->
<!--                textAlign: TextAlign.center,-->
<!--                style: TextStyle(color: Colors.white, fontSize: 25),-->
<!--              ),-->
<!--              Spacer(),-->
<!--              Row(-->
<!--                crossAxisAlignment: CrossAxisAlignment.end,-->
<!--                children: [-->
<!--                  Expanded(-->
<!--                    child: Column(-->
<!--                      crossAxisAlignment: CrossAxisAlignment.start,-->
<!--                      children: [-->
<!--                        Row(-->
<!--                          crossAxisAlignment: CrossAxisAlignment.start,-->
<!--                          children: [-->
<!--                            Text(-->
<!--                              "VALID\nTRU",-->
<!--                              style: TextStyle(-->
<!--                                color: Colors.white,-->
<!--                                fontSize: 10,-->
<!--                              ),-->
<!--                            ),-->
<!--                            SizedBox(width: 10),-->
<!--                            Text(-->
<!--                              "10/21",-->
<!--                              style: TextStyle(-->
<!--                                color: Colors.white,-->
<!--                                fontSize: 17,-->
<!--                                fontWeight: FontWeight.w600,-->
<!--                              ),-->
<!--                            )-->
<!--                          ],-->
<!--                        ),-->
<!--                        SizedBox(height: 10),-->
<!--                        Text(-->
<!--                         "JOSTEVE ADEKANBI",-->
<!--                          style: TextStyle(-->
<!--                            color: Colors.white,-->
<!--                          ),-->
<!--                        )-->
<!--                      ],-->
<!--                    ),-->
<!--                  ),-->
<!--                  Image.asset(-->
<!--                    "assets/images/mastercardlogo.png",-->
<!--                    height: 30,-->
<!--                  )-->
<!--                ],-->
<!--              ),-->
<!--            ],-->
<!--          ),-->
<!--          decoration: BoxDecoration(-->
<!--            borderRadius: BorderRadius.circular(10),-->
<!--            gradient: LinearGradient(-->
<!--              colors: [Colors.pink, Colors.purple],-->
<!--            ),-->
<!--            boxShadow: [-->
<!--              BoxShadow(-->
<!--                color: Colors.grey.withOpacity(0.2),-->
<!--                blurRadius: 1.0,-->
<!--                spreadRadius: 1.0,-->
<!--              ),-->
<!--            ],-->
<!--          ),-->
<!--        ),-->
<!--      ),-->
<!--    );-->
<!--  }-->

<!--  EdgeInsets get cardPadding => EdgeInsets.symmetric(horizontal: 20, vertical: 20);-->

<!--  String get getCardPan {-->
<!--    return ("1234567890181234").replaceAllMapped(-->
<!--                  RegExp(r".{4}"), (match) => "${match.group(0)}       ");-->
<!--  }-->
<!--}-->
<!--```-->




