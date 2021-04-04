import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:meet4coffee/utilities.dart';

class RoomPage extends StatefulWidget {
  RoomPage({Key key, this.roomType, this.icon, this.user}) : super(key: key);
  String roomType;
  Icon icon;
  Profile user;

  @override
  _RoomPageState createState() => _RoomPageState(user: user);
}

class _RoomPageState extends State<RoomPage> {
  _RoomPageState({this.user});
  Profile user;
  bool hasSelected = false;
  Widget selection = Container();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final workspace = Provider.of<Workspace>(context);
    print(workspace.coffeeBreaks);

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: mainBrown,
      body: Column(children: [
        Align(
          alignment: Alignment.centerRight,
          child: Hero(
            tag: widget.roomType,
            child: Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
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
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          widget.icon,
                          Text(
                            widget.roomType,
                            style: TextStyle(
                                color: mainBrown,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          )
                        ]))),
          ),
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            height: 250,
            width: screenWidth,
            child: likeSelection(widget.roomType)),
        SizedBox(
          height: 20,
        ),
        Flexible(child: getRoomList(workspace, widget.roomType))
      ]),
    );
  }

  Widget likeSelection(String roomType) {
    if (roomType == "Coffee") {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 16, 40, 16),
            child: Text(
              "Let your colleagues know what you're drinking",
              style: TextStyle(
                  fontSize: 20, color: mainBrown, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
              child: hasSelected
                  ? Center(
                      child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Card(color: Colors.white70, child: profileTile(user)),
                          Align(
                            alignment: Alignment.centerRight,
                            child: selection,
                          )
                        ],
                      ),
                    ))
                  : ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        choiceCards(
                          "Tea",
                          EdgeInsets.only(right: 8),
                          Colors.green,
                          FontAwesomeIcons.leaf,
                        ),
                        choiceCards(
                          "Coffee",
                          EdgeInsets.only(left: 8),
                          Colors.brown,
                          FontAwesomeIcons.mugHot,
                        ),
                        choiceCards(
                          "Water",
                          EdgeInsets.only(right: 0),
                          Colors.blue,
                          FontAwesomeIcons.glassWhiskey,
                        ),
                        choiceCards(
                          "Something Unusual",
                          EdgeInsets.only(right: 0),
                          Colors.grey,
                          FontAwesomeIcons.question,
                        ),
                        choiceCards(
                          "Not Thirsty",
                          EdgeInsets.only(right: 0),
                          Colors.black87,
                          FontAwesomeIcons.stop,
                        ),
                      ],
                    ))
        ],
      );
    } else if (roomType == "Games") {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 16, 40, 16),
            child: Text(
              "Let your colleagues know what games you like to play",
              style: TextStyle(
                  fontSize: 20, color: mainBrown, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
              child: hasSelected
                  ? Center(
                      child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Card(color: Colors.white70, child: profileTile(user)),
                          Align(
                            alignment: Alignment.centerRight,
                            child: selection,
                          )
                        ],
                      ),
                    ))
                  : ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        choiceCards(
                          "Scribbl.io",
                          EdgeInsets.only(right: 0),
                          Colors.blue,
                          FontAwesomeIcons.pen,
                        ),
                        choiceCards(
                          "Hangman",
                          EdgeInsets.only(right: 12),
                          Colors.brown,
                          FontAwesomeIcons.hatCowboy,
                        ),
                        choiceCards(
                          "Word Games",
                          EdgeInsets.only(right: 0),
                          Colors.green,
                          FontAwesomeIcons.textHeight,
                        ),
                      ],
                    ))
        ],
      );
    } else if (roomType == "Workout") {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 16, 40, 16),
            child: Text(
              "Let your colleagues know what 5-minute workout you want to do",
              style: TextStyle(
                  fontSize: 20, color: mainBrown, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
              child: hasSelected
                  ? Center(
                      child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Card(color: Colors.white70, child: profileTile(user)),
                          Align(
                            alignment: Alignment.centerRight,
                            child: selection,
                          )
                        ],
                      ),
                    ))
                  : ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        choiceCards(
                          "Strength",
                          EdgeInsets.only(right: 14),
                          Colors.purple,
                          FontAwesomeIcons.dumbbell,
                        ),
                        choiceCards(
                          "Cardio",
                          EdgeInsets.only(right: 0),
                          Colors.blue,
                          FontAwesomeIcons.running,
                        ),
                        choiceCards(
                          "Yoga",
                          EdgeInsets.only(right: 0),
                          Colors.green,
                          Icons.mediation,
                        ),
                      ],
                    ))
        ],
      );
    }

    return Center(child: Text("Something has gone wrong :("));
  }

  Widget choiceCards(
      String name, EdgeInsets padding, Color color, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border.all(width: 1, color: Colors.black.withOpacity(0.3)),
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 0.5,
                  blurRadius: 4,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            height: 180,
            width: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: padding,
                  child: Icon(iconData, size: 60, color: color),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  name,
                  style: TextStyle(
                      color: color, fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    hasSelected ? hasSelected = false : hasSelected = true;
                    selection = Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Stack(
                        children: [
                          Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Icon(iconData, size: 30, color: color)),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      hasSelected
                                          ? hasSelected = false
                                          : hasSelected = true;
                                      selection = Container();
                                    });
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                  ),
                                )),
                          )
                        ],
                      ),
                    );
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  height: 180,
                  width: 120,
                ),
              ))
        ],
      ),
    );
  }

  getRoomList(Workspace workspace, String roomType) {
    Map rooms = {};
    if (roomType == "Coffee") {
      rooms = workspace.coffeeBreaks;
    } else if (roomType == "Games") {
      rooms = workspace.gameBreaks;
    } else if (roomType == "Workout") {
      rooms = workspace.workoutBreaks;
    }
    List roomList = rooms.keys.toList();

    return ListView.builder(
      itemCount: roomList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: ListTile(
            title: Text(roomList[index]),
            subtitle: Text(rooms[roomList[index]][1].toString()),
            trailing: Text(rooms[roomList[index]][0].toString()),
          ),
        );
      },
    );
  }
}
