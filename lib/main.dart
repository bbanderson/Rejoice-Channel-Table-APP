import 'package:flutter/material.dart';
import 'channel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rejoicer',
      theme: ThemeData(
          primarySwatch: Colors.amber,
          fontFamily: 'qn'
      ),
      debugShowCheckedModeBanner: false,
      home: Channel(),
    );
  }
}
