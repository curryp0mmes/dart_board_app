import 'package:dart_board_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenHandler extends StatefulWidget {
  @override
  _ScreenHandlerState createState() => _ScreenHandlerState();
}

class _ScreenHandlerState extends State<ScreenHandler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Theme.of(context).primaryColor),
        backwardsCompatibility: false,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: Text("Darts"),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40.0
        ),
        //elevation: 0.0,
      ),

      body: StartScreen(),
    );
  }
}
