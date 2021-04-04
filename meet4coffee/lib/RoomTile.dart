import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meet4coffee/CallPage.dart';
import 'package:meet4coffee/database.dart';
import 'package:meet4coffee/utilities.dart';
import 'package:permission_handler/permission_handler.dart';

class RoomTile extends StatefulWidget {
  RoomTile(
      {Key key,
      this.roomList,
      this.rooms,
      this.index,
      this.user,
      this.roomType})
      : super(key: key);
  Map rooms;
  List roomList;
  int index;
  Profile user;
  String roomType;

  @override
  RoomTileState createState() =>
      RoomTileState(roomList: roomList, rooms: rooms, index: index);
}

class RoomTileState extends State<RoomTile> {
  Map rooms;
  List roomList;
  int index;
  RoomTileState({this.roomList, this.rooms, this.index});

  @override
  Widget build(BuildContext context) {
    DateTime breakTime = rooms[roomList[index]][1] != null
        ? rooms[roomList[index]][1].toDate()
        : null;
    int callers = rooms[roomList[index]][0];
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ListTile(
                title: Text(roomList[index]),
                subtitle: Text(time(breakTime, 0)),
                trailing: SizedBox(
                  child: people(callers, breakTime),
                  width: 100,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: onJoin,
                    child: Container(
                      width: screenWidth,
                      height: 80,
                    )),
              )),
        ),
        openRoom(breakTime)
            ? Container()
            : Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: screenWidth,
                    height: 80,
                    color: mainBrown.withOpacity(0.7),
                  ),
                ),
              )
      ],
    );
  }

  Future<void> onJoin() async {
    // await for camera and mic permissions before pushing video page
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
    await joinRoom(roomList[index], widget.roomType, rooms);
    // push video page with given channel name
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CallPage(
            channelName: roomList[index],
            role: ClientRole.Broadcaster,
            user: widget.user,
            roomType: widget.roomType,
            roomsList: rooms),
      ),
    );
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }

  time(DateTime dateTime, int count) {
    if (dateTime == null) {
      return "Open";
    }

    String ampm = "AM";
    int hour = dateTime.hour;

    if (hour > 12) {
      hour = hour - 12;
      ampm = "PM";
    }

    String hourStr = hour.toString();

    if (hourStr.length == 1) {
      hourStr = "0" + hourStr;
    }

    int minute = dateTime.minute;
    String minuteStr = minute.toString();

    if (minuteStr.length == 1) {
      minuteStr = "0" + minuteStr;
    }

    if (count == 1) {
      return "- $hourStr:$minuteStr $ampm";
    }

    return "$hourStr:$minuteStr $ampm " +
        time(dateTime.add(Duration(minutes: 30)), count + 1);
  }

  openRoom(DateTime breakTime) {
    if (breakTime == null) {
      return true;
    }

    DateTime now = DateTime.now();
    if (breakTime.isAfter(now) ||
        breakTime.add(Duration(minutes: 30)).isBefore(now)) {
      return false;
    }
    return true;
  }

  people(int callers, DateTime breakTime) {
    if (!openRoom(breakTime)) {
      return Center(
          child: Icon(
        FontAwesomeIcons.lock,
        size: 30,
        color: mainBrown,
      ));
    }

    List filled = [0, 0, 0, 0];
    for (var i = 0; i < callers; i++) {
      filled[i] = 1;
    }

    List<Widget> people = [];
    double spacing = 0;

    filled.forEach((element) {
      people.add(Padding(
        padding: EdgeInsets.only(left: spacing),
        child: Icon(
          FontAwesomeIcons.male,
          size: 36,
          color: element == 1 ? mainBrown : mainBrown.withOpacity(0.2),
        ),
      ));
      spacing += 20;
    });

    return Stack(
      children: people,
    );
  }
}
