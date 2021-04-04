import 'package:flutter/material.dart';

String appID = "Enter APP ID";
const mainBrown = const Color(0xFF865A5A);

class Profile {
  String name;
  String role;

  Profile(this.name, this.role);
}

Widget profileTile(Profile user) {
  return ListTile(
    title: Text(
      user.name,
      style: TextStyle(color: mainBrown, fontWeight: FontWeight.w600),
    ),
    subtitle:
        Text(user.role, style: TextStyle(color: mainBrown.withOpacity(0.7))),
  );
}

class Workspace {
  Map coffeeBreaks;
  Map gameBreaks;
  Map workoutBreaks;

  Workspace({this.coffeeBreaks, this.gameBreaks, this.workoutBreaks});
}
