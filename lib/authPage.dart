//
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rejoicer_channel_table/modifyChannel.dart';

//
class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _idController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  _showSnackBar() {
    final snackBar = SnackBar(
      content: Text('다시 시도해 주세요.'),
      action: SnackBarAction(onPressed: (){
      },),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Stack(
          children: <Widget>[
//          _inputForm(size),
            Center(
              child: Stack(
                fit: StackFit.loose,
                children: <Widget>[
                  Container(
                    color: Colors.amber[200],
                  ),
                  Container(
                    child: Center(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        child: Container(
                          width: size.width * 0.8,
                          height: size.height * 0.8,
                          child: Column(
                            children: <Widget>[
                              Container(
//                              color: Colors.amber,
                                child: Container(
//                                  color: Colors.amber,
                                  margin:
                                      EdgeInsets.only(top: size.height * 0.05),
                                  height: size.height * 0.1,
//                                  color: Colors.amber,
                                  child: Text(
                                    '채널표 수정\n관리자 모드',
                                    textAlign: TextAlign.center,
                                    textScaleFactor: 2,
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Form(
//                                key: _loginForm,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      _inputForm(size),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
//
        ),
      ),
    );
  }

  Widget _inputForm(Size size) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 0,
          child: Container(
//            color: Colors.pink,
            width: size.width * 0.65,
            height: size.height * 0.53,
            child: Scrollbar(
              child: Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      width: size.width * 0.65,
                      child: Card(
                        elevation: 0,
                        child: Text(
                          '관리자 모드에 오신 것을 환영합니다!\n보안을 위해 관리자 계정으로 로그인 해주시기 바랍니다.',
//                          textAlign: TextAlign.center,
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          icon: Icon(Icons.account_circle),
                          labelText: '이메일',
                          hintText: '관리자 전용 email'),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "관리자가 아닌 것 같아요!";
                        }
                        return null;
                      },
                      controller: _idController,
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: '비밀번호',
                      hintText: '비밀번호를 입력해주세요!',
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "비밀번호가 틀린 것 같아요!";
                      }
                      return null;
                    },
                  ),
                  _loginButton(size),
                  SizedBox(height: size.height * 0.02,),
                  _backButton(size),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(Size size) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: SizedBox(
        width: size.width * 0.65,
        height: size.height * 0.06,
        child: RaisedButton(
          child: Text(
            'Log In',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          color: Colors.amber[200],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _login(context);
//                print(_idController.text.toString());
            }
          },
        ),
      ),
    );
  }

  Widget _backButton(Size size) {
    return SizedBox(
      width: size.width * 0.65,
      height: size.height * 0.06,
      child: RaisedButton(
          child: Text('돌아가기'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }

  void _login(BuildContext context) async {
    final AuthResult result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _idController.text, password: _passwordController.text);
    final FirebaseUser user = result.user;

    if (user.metadata == null) {
    _showSnackBar();
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ModifyChannel(email: user.email)));
  }


}
