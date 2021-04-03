import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meet4coffee/animations.dart';
import 'package:meet4coffee/utilities.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Profile user = Profile("Judge 1", "Hackiethon Judge");

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double width = screenWidth * 0.90;
    double height = screenHeight * 0.10;

    return Scaffold(
        backgroundColor: mainBrown,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              height: 60,
              width: screenWidth,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 28,
                      color: mainBrown,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            OpacityIn(
              delay: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xFF602627),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                height: 200,
                width: screenWidth,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Taking breaks has been shown to be important in recovering from stress [7], which can, in turn, improve your performance. Recovering from work stress can restore energy and mental resources and decrease the development of fatigue, sleep disorders and cardiovascular disease [2]. ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                mainButton(() {
                  print("coffee");
                },
                    "Coffee",
                    Icon(
                      FontAwesomeIcons.coffee,
                      size: 40,
                      color: mainBrown,
                    ),
                    width,
                    height),
                mainButton(() {
                  print("Games");
                },
                    "Games",
                    Icon(
                      FontAwesomeIcons.gamepad,
                      size: 40,
                      color: mainBrown,
                    ),
                    width,
                    height),
                mainButton(() {
                  print("Workout");
                },
                    "Workout",
                    Icon(
                      FontAwesomeIcons.dumbbell,
                      size: 40,
                      color: mainBrown,
                    ),
                    width,
                    height)
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: FadeInRight(
                  delay: 0.5,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 70,
                    width: screenWidth * 0.7,
                    child: Stack(
                      children: [
                        ListTile(
                          title: Text(
                            user.name,
                            style: TextStyle(
                                color: mainBrown, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(user.role,
                              style:
                                  TextStyle(color: mainBrown.withOpacity(0.7))),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 70,
                                  width: screenWidth * 0.7,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget mainButton(
      Function onTap, String name, Icon icon, double width, double height) {
    return FadeIn(
      delay: 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              height: height,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    icon,
                    Text(
                      name,
                      style: TextStyle(
                          color: mainBrown,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: onTap,
                      child: Container(
                        height: height,
                        width: width,
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
