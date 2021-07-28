import 'package:flutter/material.dart';
import 'round_button.dart';
import 'login_screen.dart';
import 'constants.dart';


class RegisterScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.account_circle, size: 200.0),
            SizedBox(
              height: 48.0,
            ),
            TextField(

              decoration: kTextFieldDecoration.copyWith(prefixIcon: Icon(Icons.account_box),
                  hintText: "Enter your name"
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(

              decoration: kTextFieldDecoration.copyWith(prefixIcon: Icon(Icons.account_box),
                  hintText: "Enter your username"
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              decoration: kTextFieldDecoration.copyWith(prefixIcon: Icon(Icons.account_box),
                  hintText: "Enter your password"
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundButton(
              title: 'Register',
              colour: Colors.blueAccent,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
