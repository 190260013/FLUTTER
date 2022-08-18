import 'package:apk_store/screens/register.dart';
import 'package:apk_store/screens/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool show = true;

  void toggleView(){
    setState(() {
      show = !show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: show ? SignIn(
        toggle : toggleView,
      ) : Register(
        toggle : toggleView,
      ),
    );
  }
}
