import 'package:flutter/material.dart';
import 'round_button.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(title: Text('Profile Screen'),),
            body: Center(
                child: Column(children: <Widget>[
                  RoundButton(
                    colour: Colors.red,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: 'Click Here To Logout',
                  ),
                ],)
            )
        )
    );
  }
}