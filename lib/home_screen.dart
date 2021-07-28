import 'package:flutter/material.dart';
import 'round_button.dart';
import 'login_screen.dart';
import 'register.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool signin=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.account_circle, size: 200.0),
            SizedBox(
              height: 10.0,
            ),
            RoundButton(
              title: 'Log In',
              colour: Colors.lightBlueAccent,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
            ),
            RoundButton(
              title: 'Register',
              colour: Colors.lightBlueAccent,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
              },
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

