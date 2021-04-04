import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meet4coffee/RoomPage.dart';
import 'package:meet4coffee/utilities.dart';

class DatabaseService {
  DatabaseService();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference workspaces =
      FirebaseFirestore.instance.collection('workspace');

  Workspace workspaceFromSnapshot(DocumentSnapshot snapshot) {
    return Workspace(
        coffeeBreaks: snapshot.data()["Coffee"],
        gameBreaks: snapshot.data()["Games"],
        workoutBreaks: snapshot.data()["Workout"]);
  }

  Stream<Workspace> get workspaceDataStream {
    return workspaces.doc("Hackiethon").snapshots().map(workspaceFromSnapshot);
  }
}

joinRoom(
  String room,
  String roomType,
  Map roomList,
) async {
  roomList[room][0] += 1;

  DatabaseService().workspaces.doc("Hackiethon").update({roomType: roomList});
}

leaveRoom(String room, String roomType, Map roomList) async {
  roomList[room][0] -= 1;

  DatabaseService().workspaces.doc("Hackiethon").update({roomType: roomList});
}
