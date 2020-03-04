import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rejoicer_channel_table/crud.dart';

class ModifyChannel extends StatefulWidget {
  ModifyChannel({this.email});

  final String email;

  static BuildContext get context => null;

  @override
  _ModifyChannelState createState() => _ModifyChannelState();
}

class _ModifyChannelState extends State<ModifyChannel> {
  IconData _icon;

  String modifiedChannel;

  crudMethods crudObj = new crudMethods();


  Future<bool> updateDialogIn(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Input채널 변경하기', style: TextStyle(fontSize: 15.0)),
            content: Container(
              height: 125.0,
              width: 150.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: '변경 후의 채널을 입력해주세요!'),
                    onChanged: (value) {
                      this.modifiedChannel = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('수정'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                  crudObj.updateData(selectedDoc, {
                    'In': this.modifiedChannel,
                  }).then((result) {
                    // dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              ),
              FlatButton(
                child: Text('취소'),
                textColor: Colors.red,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Future<bool> updateDialogOut(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Monitor채널 변경하기', style: TextStyle(fontSize: 15.0)),
            content: Container(
              height: 125.0,
              width: 150.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: '변경 후의 채널을 입력해주세요!'),
                    onChanged: (value) {
                      this.modifiedChannel = value;
                    },
                  ),
                  SizedBox(height: 5.0),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('수정'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                  crudObj.updateData(selectedDoc, {
                    'Out': this.modifiedChannel,
                  }).then((result) {
                    // dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
                },
              ),
              FlatButton(
                child: Text('취소'),
                textColor: Colors.red,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('채널 수정하기'),
        actions: <Widget>[
          Icon(_icon),
          IconButton(icon: Icon(Icons.refresh, color: Colors.grey[850],),onPressed: (){
            crudObj.getData().then((results){
              setState(() {
//                crudObj = results;
              });
            });

          },)
        ],
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('channels').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
//              _icon = Icons.cancel;
//            setState(() {
//              _icon = Icons.cancel;
//            });
            return Text('Loading data.. Please Wait..');
          }
          _icon = Icons.check_circle;
//          setState(() {
//            _icon = Icons.check_circle;
//          });
          return CupertinoScrollbar(
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
//                  Column(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: <Widget>[
//                      FlatButton(child: Text('0')),
//                      FlatButton(child: Text('1')),
//                      FlatButton(child: Text('2')),
//                      FlatButton(child: Text('3')),
//                      FlatButton(child: Text('4')),
//                      FlatButton(child: Text('5')),
//                      FlatButton(child: Text('6')),
//                      FlatButton(child: Text('7')),
//                      FlatButton(child: Text('8')),
//                      FlatButton(child: Text('9')),
//                      FlatButton(child: Text('10')),
//                      FlatButton(child: Text('11')),
//                      FlatButton(child: Text('12')),
//                      FlatButton(child: Text('13')),
//                      FlatButton(child: Text('14')),
//                      FlatButton(child: Text('15')),
//                      FlatButton(child: Text('16')),
//                      FlatButton(child: Text('17')),
//                      FlatButton(child: Text('18')),
//                      FlatButton(child: Text('19')),
//                      FlatButton(child: Text('20')),
//                      FlatButton(child: Text('21')),
//                      FlatButton(child: Text('22')),
//                      FlatButton(child: Text('23')),
//                      FlatButton(child: Text('24')),
//                      FlatButton(child: Text('25')),
//                    ],
//                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('CHANNEL'),
                      FlatButton(child: Text('A.G')),
                      FlatButton(child: Text('Bass')),
                      FlatButton(child: Text('E.G 1')),
                      FlatButton(child: Text('E.G 2')),
                      FlatButton(child: Text('Hi-Hat')),
                      FlatButton(child: Text('Kick')),
                      FlatButton(child: Text('Motif')),
                      FlatButton(child: Text('OH L')),
                      FlatButton(child: Text('OH R')),
                      FlatButton(child: Text('S90ES')),
                      FlatButton(child: Text('Singer 1')),
                      FlatButton(child: Text('Singer 10')),
                      FlatButton(child: Text('Singer 2')),
                      FlatButton(child: Text('Singer 3')),
                      FlatButton(child: Text('Singer 4')),
                      FlatButton(child: Text('Singer 5')),
                      FlatButton(child: Text('Singer 6')),
                      FlatButton(child: Text('Singer 7')),
                      FlatButton(child: Text('Singer 8')),
                      FlatButton(child: Text('Singer 9')),
                      FlatButton(child: Text('Snare')),
                      FlatButton(child: Text('Tom 1')),
                      FlatButton(child: Text('Tom 2')),
                      FlatButton(child: Text('Tom 3')),
                      FlatButton(child: Text('Triton')),
                      FlatButton(child: Text('인도자')),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('INPUT'),
                      FlatButton(child: Text(snapshot.data.documents[0]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[0].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[1]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[1].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[2]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[2].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[3]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[3].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[4]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[4].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[5]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[5].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[6]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[6].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[7]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[7].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[8]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[8].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[9]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[9].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[10]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[10].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[11]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[11].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[12]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[12].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[13]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[13].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[14]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[14].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[15]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[15].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[16]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[16].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[17]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[17].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[18]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[18].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[19]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[19].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[20]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[20].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[21]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[21].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[22]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[22].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[23]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[23].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[24]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[24].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[25]['In']), onPressed: (){updateDialogIn(context, snapshot.data.documents[25].documentID);},),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('MONITOR'),
                      FlatButton(child: Text(snapshot.data.documents[0]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[0].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[1]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[1].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[2]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[2].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[3]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[3].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[4]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[4].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[5]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[5].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[6]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[6].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[7]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[7].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[8]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[8].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[9]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[9].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[10]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[10].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[11]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[11].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[12]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[12].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[13]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[13].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[14]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[14].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[15]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[15].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[16]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[16].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[17]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[17].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[18]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[18].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[19]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[19].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[20]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[20].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[21]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[21].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[22]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[22].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[23]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[23].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[24]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[24].documentID);},),
                      FlatButton(child: Text(snapshot.data.documents[25]['Out']), onPressed: (){updateDialogOut(context, snapshot.data.documents[25].documentID);},),
                    ],
                  ),
                ],
              ),
            ),
          );

        },
      ),
    );
  }
}
