//
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//
//class AuthPage extends StatelessWidget {
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//  final TextEditingController _idController = TextEditingController();
//  final TextEditingController _passwordController = TextEditingController();
//
//
//  @override
//  Widget build(BuildContext context) {
//
//    Size size = MediaQuery.of(context).size;
//    return Scaffold(
//
//      body: Stack(
//
//          children: <Widget>[
//          _inputForm(size),
//          SizedBox(),
//          Container(
//            child: RaisedButton(
//                child: Text('돌아가기'),
//                onPressed: () {
//                  Navigator.pop(context);
//                }),
//          ),
//        ],
////
//        ),
//      );
//  }
//
//  void _login() async {
//    final AuthResult result = await FirebaseAuth.instance
//        .signInWithEmailAndPassword(
//            email: _idController.text, password: _passwordController.text);
////    final FirebaseUser user = result.user;
//
////    if (user == null) {
////      final snackBar = SnackBar(
////        content: Text('다시 시도해 주세요.'),
////      );
////      Scaffold.of(context).showSnackBar(snackBar);
//    }
//
////    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage(email: user.email)));
//  Widget _inputForm(Size size) {
//    return Padding(
//      padding: EdgeInsets.all(size.width * 0.05),
//      child: Card(
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(16),
//        ),
//        elevation: 10.0,
//        child: Padding(
//          padding: const EdgeInsets.only(
//            left: 12.0,
//            right: 12.0,
//            top: 12.0,
//            bottom: 32.0,
//          ),
//          child: Form(
//              key: _formKey,
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  TextFormField(
//                    keyboardType: TextInputType.emailAddress,
//                    controller: _idController,
//                    decoration: InputDecoration(
//                      icon: Icon(Icons.account_circle),
//                      labelText: '이메일',
//                      hintText: '실제 사용하시는 이메일을 입력해주세요!',
//                    ),
//                    validator: (String value) {
//                      if (value.isEmpty) {
//                        return "Rejoicer가 아닌 것 같아요!";
//                      }
//                      return null;
//                    },
//                  ),
//                  TextFormField(
//                    keyboardType: TextInputType.visiblePassword,
//                    obscureText: true,
//                    controller: _passwordController,
//                    decoration: InputDecoration(
//                      icon: Icon(Icons.vpn_key),
//                      labelText: '비밀번호',
//                      hintText: '비밀번호를 입력해주세요!',
//                    ),
//                    validator: (String value) {
//                      if (value.isEmpty) {
//                        return "비밀번호가 틀린 것 같아요!";
//                      }
//                      return null;
//                    },
//                  ),
//                  Container(
//                    height: 8,
//                  ),
//                  _loginButton(size),
//                ],
//              )),
//        ),
//      ),
//    );
//  }
//
//  Widget _bottomBar(Size size) {
//    return Container(
//      margin: EdgeInsets.all(20),
//      child: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          mainAxisSize: MainAxisSize.max,
//          children: <Widget>[
////          _kakaoLogin(),
//            RaisedButton(
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(20)),
//                disabledColor: Colors.grey[850],
////        elevation: 0.0,
//                child: Text(
//                  '계정이 없으시면 Leader에게 문의하세요!',
//                  textAlign: TextAlign.center,
//                  style: TextStyle(
//                      fontWeight: FontWeight.bold, color: Colors.white),
//                )),
//          ]),
//    );
//  }
//
//  Widget _loginButton(Size size) {
//    return Positioned(
//      left: size.width * 0.15,
//      right: size.width * 0.15,
//      bottom: 0,
//      child: SizedBox(
//        height: 50,
//        child: RaisedButton(
//          child: Text(
//            'Let\'s get it!',
//            style: TextStyle(fontSize: 20, color: Colors.black),
//          ),
//          color: Colors.orange,
//          shape:
//          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//          onPressed: () {
//            if (_formKey.currentState.validate()) {
//              _login();
////                print(_idController.text.toString());
//            }
//          },
//        ),
//      ),
//    );
//  }
//
////  goToForgetPw(BuildContext context) {
////    Navigator.push(
////        context, MaterialPageRoute(builder: (context) => ForgetPw()));
////  }
//}
//
//
//
//
