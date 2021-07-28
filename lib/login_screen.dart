import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'profile_screen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'round_button.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernamectrl, passwordctrl;

  void userSignin() async {
    var url = Uri.parse("https://depurative-knots.000webhostapp.com/login.php");
    var data = {
      "username": usernamectrl.text,
      "password": passwordctrl.text,
    };
    var res = await http.post(url, body: data);

    if (jsonDecode(res.body) == "dont have an account") {
      Fluttertoast.showToast(msg: "dont have an account, Create an  account", toastLength: Toast.LENGTH_SHORT);
    }else{
      if(jsonEncode(res.body)=="false"){
        Fluttertoast.showToast(msg: "incorrect password", toastLength: Toast.LENGTH_SHORT);
      }else{
        print(jsonEncode(res.body));
      }
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void validator() {
    if (formKey.currentState.validate()) {
      print("vaidated");
    } else {
      print("not validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.account_circle, size: 200.0),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return "*Required";
                  } else if (value.length < 6) {
                    return "username should be at least 6 characters";
                  } else if (value.length > 12) {
                    return "username should be atmost 12 characters";
                  } else
                    return null;
                },
                decoration: kTextFieldDecoration.copyWith(
                  prefixIcon: Icon(Icons.account_box),
                  hintText: "Enter your username",
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return "*Required";
                  } else if (value.length < 6) {
                    return "Password should be at least 6 characters";
                  } else
                    return null;
                },
                decoration: kTextFieldDecoration.copyWith(
                    prefixIcon: Icon(Icons.account_box),
                    hintText: "Enter your password"),
              ),
              RoundButton(
                  title: 'LOG IN',
                  colour: Colors.lightBlueAccent,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()));
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
