import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meet4coffee/RoomPage.dart';
import 'package:meet4coffee/animations.dart';
import 'package:meet4coffee/utilities.dart';
import 'package:provider/provider.dart';

import 'database.dart';

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

    String name = "";
    String role = "";
    bool wfr = false;
    final _formkey = GlobalKey<FormState>();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: mainBrown,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
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
                width: screenWidth * 0.95,
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
            ),
            Container(
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
                  "It is important to take breaks when you're working from home and socialise to mitigate unnecessary stress. Meet4Coffee aims to provide this platform which allows employees to actively communicate with each other  in order to recover from stress and loneliness which can in turn, improve performance and long-term employee satisfaction!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
            ),
            Align(
              alignment: Alignment.bottomLeft,
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
                      profileTile(user),
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => showDialog<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Profile'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          Form(
                                            key: _formkey,
                                            child: Column(
                                              children: [
                                                FadeIn(
                                                  delay: 1,
                                                  child: TextFormField(
                                                    initialValue: user.name,
                                                    decoration: InputDecoration(
                                                      errorStyle: TextStyle(
                                                          color: Colors.red),
                                                      hintText: "Judge",
                                                      labelText: "Name",
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                    ),
                                                    validator: (val) => val
                                                            .isEmpty
                                                        ? 'Please enter a name'
                                                        : null,
                                                    onChanged: (val) {
                                                      setState(
                                                          () => name = val);
                                                    },
                                                  ),
                                                ),
                                                FadeIn(
                                                  delay: 1,
                                                  child: TextFormField(
                                                    initialValue: user.role,
                                                    decoration: InputDecoration(
                                                      errorStyle: TextStyle(
                                                          color: Colors.red),
                                                      hintText:
                                                          "Hackiethon Judge",
                                                      labelText: "Role",
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                    ),
                                                    validator: (val) => val
                                                            .isEmpty
                                                        ? 'Please enter a role'
                                                        : null,
                                                    onChanged: (val) {
                                                      setState(
                                                          () => role = val);
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('Approve'),
                                        onPressed: () {
                                          if (_formkey.currentState
                                              .validate()) {
                                            setState(() {
                                              user.name = name;
                                              user.role = role;
                                            });
                                            Navigator.of(context).pop();
                                          }
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
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
            Hero(
              tag: name,
              child: Container(
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
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  StreamProvider<Workspace>.value(
                                      initialData: Workspace(
                                          coffeeBreaks: {},
                                          workoutBreaks: {},
                                          gameBreaks: {}),
                                      value:
                                          DatabaseService().workspaceDataStream,
                                      builder: (context, snapshot) {
                                        return RoomPage(
                                          roomType: name,
                                          icon: icon,
                                          user: user,
                                        );
                                      })),
                        );
                      },
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
