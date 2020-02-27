//
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//
class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//  final TextEditingController _idController = TextEditingController();
//
//  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(

      body: Stack(

        children: <Widget>[
//          _inputForm(size),
          SizedBox(),
          Container(
            child: RaisedButton(
                child: Text('돌아가기'),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ],
//
      ),
    );
  }
}
