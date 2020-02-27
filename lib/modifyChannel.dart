import 'package:flutter/material.dart';

import 'channel.dart';

class ModifyChannel extends StatefulWidget {
  ModifyChannel({this.email});

  final String email;

  static BuildContext get context => null;

  @override
  _ModifyChannelState createState() => _ModifyChannelState();
}

class _ModifyChannelState extends State<ModifyChannel> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modify Channel'),
      ),
    );
  }
}
