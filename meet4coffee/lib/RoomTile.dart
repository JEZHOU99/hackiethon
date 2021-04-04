import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:meet4coffee/CallPage.dart';
import 'package:permission_handler/permission_handler.dart';

class RoomTile extends StatefulWidget {
  RoomTile({Key key, this.roomList, this.rooms, this.index}) : super(key: key);
  Map rooms;
  List roomList;
  int index;

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
              subtitle: Text(rooms[roomList[index]][1].toString()),
              trailing: Text(rooms[roomList[index]][0].toString()),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onJoin,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ListTile(),
                    ),
                  ),
                )),
          ),
        ),
      ],
    );
  }

  Future<void> onJoin() async {
    // await for camera and mic permissions before pushing video page
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
    // push video page with given channel name
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CallPage(
          channelName: roomList[index],
          role: ClientRole.Broadcaster,
        ),
      ),
    );
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}
