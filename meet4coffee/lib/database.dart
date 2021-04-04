import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meet4coffee/utilities.dart';

class DatabaseService {
  DatabaseService();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference workspaces =
      FirebaseFirestore.instance.collection('workspace');

  Workspace workspaceFromSnapshot(DocumentSnapshot snapshot) {
    return Workspace(
        coffeeBreaks: snapshot.data()["coffeeBreaks"],
        gameBreaks: snapshot.data()["gameBreaks"],
        workoutBreaks: snapshot.data()["workoutBreaks"]);
  }

  Stream<Workspace> get workspaceDataStream {
    return workspaces.doc("Hackiethon").snapshots().map(workspaceFromSnapshot);
  }
}
