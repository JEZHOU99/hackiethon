import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meet4coffee/animations.dart';
import 'package:meet4coffee/utilities.dart';

import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Co lors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String workspace = "";
  bool raiseButton = false;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBrown,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Meet4Coffee",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Splendid Sips. Together",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Icon(
              FontAwesomeIcons.coffee,
              color: Colors.white,
              size: 40,
            ),
            SizedBox(
              height: 40,
            ),
            Form(
                key: _formkey,
                child: FadeIn(
                  delay: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40.0, 0, 40, 10),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.red),
                            hintText: "Workspace ID (Try 'Hackiethon'）",
                            fillColor: Colors.white,
                            filled: true,
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                                borderRadius: BorderRadius.circular(12)),
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2.0),
                                borderRadius: BorderRadius.circular(12)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          validator: (val) => val != "Hackiethon"
                              ? 'pssst! Try "Hackiethon'
                              : null,
                          onChanged: (val) {
                            setState(() => workspace = val);
                          },
                        ),
                        workspace.length > 0
                            ? Padding(
                                padding: raiseButton
                                    ? EdgeInsets.only(bottom: 20)
                                    : EdgeInsets.only(bottom: 0),
                                child: OpacityIn(
                                  delay: 0.1,
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  workspace != "Hackiethon"
                                                      ? raiseButton = true
                                                      : raiseButton = false;
                                                });

                                                if (_formkey.currentState
                                                    .validate()) {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            MyHomePage(
                                                              title: workspace,
                                                            )),
                                                  );
                                                }
                                              },
                                              child: Container(
                                                  height: 60,
                                                  width: 60,
                                                  child: Icon(
                                                    Icons.arrow_right_alt,
                                                    size: 50,
                                                    color: mainBrown,
                                                  )),
                                            )),
                                      )),
                                ),
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
