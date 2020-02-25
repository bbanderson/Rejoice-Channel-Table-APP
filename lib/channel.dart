import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Channel extends StatefulWidget {
  @override
  _ChannelState createState() => _ChannelState();
}

class _ChannelState extends State<Channel> {
  int channelIndex = 0;
  List channels;
  Color tabColor;
  Color unSelectedTabColor;
  bool isSelect;
  String input;
  String monitor;
  Color selectedChannelColor;
  Color unselectedChannelColor;
  String status;
  String currentChannel;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    channels = [singerList(), guitarList(), keysList(), drumList()];
    tabColor = Colors.amber[200];
    unSelectedTabColor = Colors.grey[200];
    isSelect = false;
    input = '채널을 선택해주세요!';
    monitor = '채널을 선택해주세요!';
    selectedChannelColor = null;
    status = '채널을 선택해주세요!';
    currentChannel = 'Channel';
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.build),
          centerTitle: true,
          title: Text('채널표'),
          backgroundColor: Colors.amber[200],
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
//                width: size.width * 0.3,
//                color: Colors.red,
                children: <Widget>[
                  Card(
//                  margin: EdgeInsets.only(top: 10, bottom: 10),
                      color: Colors.amber,
                      elevation: 0,
                      child: Text(currentChannel))
                ],
              ),
            ),
          ],
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          return Container(
            width: size.width,
            height: size.height,
            child: Column(
              children: <Widget>[
                Container(
                  height: size.height * 0.1,
                  width: size.width,
                  child: Flex(
                    crossAxisAlignment: CrossAxisAlignment.end,
//                  mainAxisSize: MainAxisSize.min,
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: size.width * 0.2,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          color: channelIndex == 0
                              ? tabColor = Colors.amber[200]
                              : unSelectedTabColor = Colors.grey[200],
                          splashColor: Colors.amber[200],
                          child: Text(
                            'Singer',
                            style: TextStyle(fontSize: 11),
                          ),
                          onPressed: () {
                            context:
                            _onItemTapped(0);
                            _showResult('채널을 선택해주세요!', '채널을 선택해주세요!');

                            isSelect = !isSelect;
//                          _clickedTabColor(isSelect);

//                                channelSaved.changeChannelList(item)
                            setState(() {
                              channelIndex = 0;
//                                channelSaved.savedStream;
                              channels[channelIndex] = singerList();
                            });
                          },
                        ),
                      ),
                      Container(
                        width: size.width * 0.2,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            color: channelIndex == 1
                                ? tabColor = Colors.amber[200]
                                : unSelectedTabColor = Colors.grey[200],
                            splashColor: Colors.amber[200],
                            child: Text(
                              'Guitar',
                              style: TextStyle(fontSize: 11),
                            ),
                            onPressed: () {
                              _onItemTapped(1);
                              _showResult('채널을 선택해주세요!', '채널을 선택해주세요!');
                              isSelect = !isSelect;
//                            _clickedTabColor(isSelect);

                              setState(() {
                                channelIndex = 1;
//                            show.removeLast();
//                            show.add(channels[channelIndex]);
                                channels[channelIndex] = guitarList();
                              });
                            }),
                      ),
                      Container(
                        width: size.width * 0.2,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            color: channelIndex == 2
                                ? tabColor = Colors.amber[200]
                                : unSelectedTabColor = Colors.grey[200],
                            splashColor: Colors.amber[200],
                            child: Text(
                              'Keys',
                              style: TextStyle(fontSize: 11),
                            ),
                            onPressed: () {
                              _onItemTapped(2);
                              _showResult('채널을 선택해주세요!', '채널을 선택해주세요!');

                              isSelect = !isSelect;
//                            _clickedTabColor(isSelect);

                              setState(() {
                                channelIndex = 2;
                                channels[channelIndex] = keysList();
//                              print(channels[channelIndex]);
                              });
                            }),
                      ),
                      Container(
                        width: size.width * 0.2,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            color: channelIndex == 3
                                ? tabColor = Colors.amber[200]
                                : unSelectedTabColor = Colors.grey[200],
                            splashColor: Colors.amber[200],
                            child: Text(
                              'Drum',
                              style: TextStyle(fontSize: 11),
                            ),
                            onPressed: () {
                              _onItemTapped(3);
                              _showResult('채널을 선택해주세요!', '24채널 1번');

                              isSelect = !isSelect;
//                            _clickedTabColor(isSelect);

                              setState(() {
                                channelIndex = 3;
                                channels[channelIndex] = drumList();
//                              print(channels[channelIndex]);
                              });
                            }),
                      ),
                    ],
                  ),
                ),
//              SizedBox(
//                child: Container(
//                  color: Colors.grey[300],
//                  margin: EdgeInsets.all(0),
//                ),
//                height: size.height * 0.001,
//              ),
                Container(
//                color: Colors.amber,
                  height: size.height * 0.45,
                  child: Card(
                    color: Colors.amber[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
                      child: channels[channelIndex],
                    ),
                  ),
                ),
                SizedBox(
                  child: Container(
//                  color: Colors.grey[300],
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  ),
                  height: size.height * 0.03,
                ),
                //result box 전체 container
                Container(
                  height: size.height * 0.25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
//                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              'INPUT\n(롤에 꽂는 그림)',
                              style: TextStyle(),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              child: Card(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      input,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                color: Colors.amber[200],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              height: size.height * 0.2 * 0.5,
                            ),
//                            Container(
//                              height: size.height * 0.2 * 0.4,
//                              color: Colors.red,
//                            ),
                            Container(
                              height: size.height * 0.07,
                              child: Image.asset(
                                'assets/xlr_m.png',
                                width: size.width * 0.11,
                                height: size.height * 0.11,
                              ),
                            ),
                          ],
                        ),
                        width: size.width * 0.38,
                        height: size.height * 0.03,

//                      color: Colors.red,
                      ),
                      Container(
                        child: Icon(Icons.compare_arrows),
                      ),
                      Container(
                        height: size.height * 0.07,
//                        color: Colors.red,
                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'MONITOR\n(롤에 꽂는 그림)',
                              style: TextStyle(),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              child: Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      monitor,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                color: Colors.amber[200],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              width: size.width,
//
                              height: size.height * 0.2 * 0.5,
                            ),
                            Container(
                              height: size.height * 0.07,
                              child: Image.asset(
                                'assets/xlr_f.png',
                                width: size.width * 0.1,
                                height: size.height * 0.1,
                              ),
                            ),
                          ],
                        ),
                        width: size.width * 0.38,
//                      color: Colors.blue,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }

  Widget _onItemTapped(int index) {
    setState(() {
      channelIndex = index;
      tabColor = Colors.amber[200];
      unSelectedTabColor = Colors.grey[200];
    });
    return channels[channelIndex];
  }

//  void _clickedTabColor(bool toggle) {
//    setState(() {
//      if (toggle) {
//        tabColor = Colors.amber[200];
//      } else {
//        tabColor = Colors.grey[200];
//      }
//    });
////    return tabColor;
//  }

  void _returnCurrentChannel(String channel) {
    setState(() {
      this.currentChannel = channel;
    });
  }

  void _chosenChannel() {
    setState(() {
      if (selectedChannelColor == Colors.amber) {
        selectedChannelColor = null;
      } else {
        selectedChannelColor = Colors.amber;
      }
    });
  }

  void _showResult(String input, String monitor) {
//    _chosenChannel();
    setState(() {
      this.input = input;
      this.monitor = monitor;
//      _returnCurrentChannel('인도자');
    });
  }

  Widget singerList() {
    return Scrollbar(
      child: ListView(
        padding: EdgeInsets.only(
          top: 10,
          right: 10,
          bottom: 10,
        ),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            color: unselectedChannelColor,
            child: ListTile(
                leading: Image.asset(
                  'assets/icons/leader_mic.png',
                  width: 40,
                  height: 40,
                  color: Colors.grey[850],
                ),
                trailing: Image.asset(
                  'assets/loading.gif',
                  height: 50,
                  width: 50,
                ),
                title: Text(
                  '인도자',
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text('Mic : Singer Box'),
                onTap: () {
                  _showResult('16채널 4번', '16채널 1번');
                  _returnCurrentChannel('인도자');

                  setState(() {});
                  print('인도자 Button is clicked.');
                }),
          ),
//                    Divider(),
          ListTile(
              leading: Image.asset(
                'assets/icons/rev_mic.png',
                width: 30,
                height: 30,
                color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                '목사님',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Mic : SHURE Wireless'),
              onTap: () {
                _showResult('Don\'t need to know', 'Don\'t need to know');
                _returnCurrentChannel('목사님');

                setState(() {});
//                          Navigator.of(context).pop();
                print('Rev Button is clicked.');
              }),
          ListTile(
              leading: Image.asset(
                'assets/icons/mic.png',
                width: 30,
                height: 30,
                color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'Singer 1',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Mic : Singer Box'),
              onTap: () {
                _showResult('16채널 5번', 'L : 16채널 2번\nR : 16채널 3번');
                _returnCurrentChannel('Singer 1');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('Singer 1 Button is clicked.');
              }),
          ListTile(
              leading: Image.asset(
                'assets/icons/mic.png',
                width: 30,
                height: 30,
                color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'Singer 2',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Mic : Singer Box'),
              onTap: () {
                _showResult('16채널 6번', 'L : 16채널 2번\nR : 16채널 3번');
                _returnCurrentChannel('Singer 2');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('Singer 2 Button is clicked.');
              }),
          ListTile(
              leading: Image.asset(
                'assets/icons/mic.png',
                width: 30,
                height: 30,
                color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'Singer 3',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Mic : Singer Box'),
              onTap: () {
                _showResult('16채널 7번', 'L : 16채널 2번\nR : 16채널 3번');
                _returnCurrentChannel('Singer 3');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('Singer 3 Button is clicked.');
              }),
          ListTile(
              leading: Image.asset(
                'assets/icons/mic.png',
                width: 30,
                height: 30,
                color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'Singer 4',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Mic : Singer Box'),
              onTap: () {
                _showResult('16채널 8번', 'L : 16채널 2번\nR : 16채널 3번');
                _returnCurrentChannel('Singer 4');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('Singer 4 Button is clicked.');
              }),
          ListTile(
              leading: Image.asset(
                'assets/icons/mic.png',
                width: 30,
                height: 30,
                color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'Singer 5',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Mic : Singer Box'),
              onTap: () {
                _showResult('16채널 9번', 'L : 16채널 2번\nR : 16채널 3번');
                _returnCurrentChannel('Singer 5');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('Singer 5 Button is clicked.');
              }),
          ListTile(
              leading: Image.asset(
                'assets/icons/mic.png',
                width: 30,
                height: 30,
                color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'Singer 6',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Mic : Singer Box'),
              onTap: () {
                _showResult('16채널 11번', 'L : 16채널 2번\nR : 16채널 3번');
                _returnCurrentChannel('Singer 6');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('Singer 6 Button is clicked.');
              }),
          ListTile(
              leading: Image.asset(
                'assets/icons/mic.png',
                width: 30,
                height: 30,
                color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'Singer 7',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Mic : Singer Box'),
              onTap: () {
                _showResult('16채널 13번', 'L : 16채널 2번\nR : 16채널 3번');
                _returnCurrentChannel('Singer 7');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('Singer 7 Button is clicked.');
              }),
          ListTile(
              leading: Image.asset(
                'assets/icons/mic.png',
                width: 30,
                height: 30,
                color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'Singer 8',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Mic : Singer Box'),
              onTap: () {
                _showResult('16채널 14번', 'L : 16채널 2번\nR : 16채널 3번');
                _returnCurrentChannel('Singer 8');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('Singer 8 Button is clicked.');
              }),
          ListTile(
              leading: Image.asset(
                'assets/icons/mic.png',
                width: 30,
                height: 30,
                color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'Singer 9',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Mic : Singer Box'),
              onTap: () {
                _showResult('16채널 15번', 'L : 16채널 2번\nR : 16채널 3번');
                _returnCurrentChannel('Singer 9');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('Singer 9 Button is clicked.');
              }),
          ListTile(
              leading: Image.asset(
                'assets/icons/mic.png',
                width: 30,
                height: 30,
                color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'Singer 10(A.G와 공유)',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Mic : Singer Box'),
              onTap: () {
                _showResult('16채널 16번', 'L : 16채널 2번\nR : 16채널 3번');
                _returnCurrentChannel('Singer 10');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('Singer 10 Button is clicked.');
              }),
        ],
//              magnification: 2,
        itemExtent: 60.0,
      ),
    );
  }

  Widget guitarList() {
    return Scrollbar(
      child: ListView(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            color: selectedChannelColor,
            child: ListTile(
                leading: Image.asset(
                  'assets/icons/guitar2.png',
                  width: 35,
                  height: 35,
                  color: Colors.grey[850],
                ),
                trailing: Image.asset(
                  'assets/loading.gif',
                  height: 50,
                  width: 50,
                ),
                title: Text(
                  'E.G 1 (현홍)',
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text('Mic : SM57'),
                onTap: () {
                  _showResult('24채널 18번', '24채널 4번\n(E.G 2와 공유)');
                  _returnCurrentChannel('E.G 1');

                  setState(() {});
                  print('E.G 1 Button is clicked.');
                }),
          ),
//                    Divider(),
          ListTile(
              leading: Image.asset(
                'assets/icons/guitar.png',
                width: 28,
                height: 28,
                color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'E.G 2 (명진)',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Mic : SM57'),
              onTap: () {
                _showResult('24채널 19번', '24채널 4번\n(E.G 1과 공유)');
                _returnCurrentChannel('E.G 2');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('E.G 2 Button is clicked.');
              }),
          ListTile(
              leading: Image.asset(
                'assets/icons/fclef.png',
                width: 33,
                height: 33,
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'Bass',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Connect to amp'),
              onTap: () {
                _showResult('24채널 17번', '24채널 5번');
                _returnCurrentChannel('Bass');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('Bass Button is clicked.');
              }),
          ListTile(
              leading: Image.asset(
                'assets/icons/fclef.png',
                width: 33,
                height: 33,
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'A.G(Singer 10과 공유)',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                '거의 사용하지 않으므로 상황에 따라 다름',
                style: TextStyle(fontSize: 10),
              ),
              onTap: () {
                _showResult('16채널 16번', 'Don\'t need to know');
                _returnCurrentChannel('A.G');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('A.G Button is clicked.');
              }),
        ],
//              magnification: 2,
        itemExtent: 60.0,
      ),
    );
  }

  Widget keysList() {
    return Scrollbar(
      child: ListView(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ListTile(
              leading: Image.asset(
                'assets/icons/piano2.png', width: 30, height: 30,
//            color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'S90ES',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('DI : Green'),
              onTap: () {
                _showResult('24채널 6번', '24채널 2번');
                _returnCurrentChannel('S90ES');

                setState(() {});
                print('S90ES Button is clicked.');
              }),
//                    Divider(),
          ListTile(
              leading: Image.asset(
                'assets/icons/piano.png',
                width: 30,
                height: 30,
                color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'Motif XF 7',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('DI : Green'),
              onTap: () {
                _showResult('24채널 7번', '24채널 3번');
                _returnCurrentChannel('Motif');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('Motif XF 7 Button is clicked.');
              }),
          ListTile(
              leading: Image.asset(
                'assets/icons/piano3.png',
                width: 29,
                height: 29,
                color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'Triton LE',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('DI : Silver'),
              onTap: () {
                _showResult('24채널 8번', '24채널 3번');
                _returnCurrentChannel('Triton');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('Triton LE Button is clicked.');
              }),
        ],
        itemExtent: 60.0,
      ),
    );
  }

  Widget drumList() {
    return Scrollbar(
      child: ListView(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            color: selectedChannelColor,
            child: ListTile(
                leading: Icon(
                  Icons.grid_on,
                  color: Colors.grey[850],
                ),
                trailing: Image.asset(
                  'assets/loading.gif',
                  height: 50,
                  width: 50,
                ),
                title: Text(
                  'Kick',
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text('Mic : SHURE Box'),
                onTap: () {
                  _showResult('24채널 9번', '24채널 1번');
                  _returnCurrentChannel('Kick');

                  setState(() {});
                  print('Kick Button is clicked.');
                }),
          ),
//                    Divider(),
          ListTile(
              leading: Icon(
                Icons.grid_on,
                color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'Snare',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Mic : Beta 87A'),
              onTap: () {
                _showResult('24채널 10번', '24채널 1번');
                _returnCurrentChannel('Snare');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('Snare Button is clicked.');
              }),
          ListTile(
              leading: Icon(
                Icons.grid_on,
                color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'Hi-Hat',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Mic : SHURE Box'),
              onTap: () {
                _showResult('24채널 11번', '24채널 1번');
                _returnCurrentChannel('Hi-Hat');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('Hi-Hat Button is clicked.');
              }),
          ListTile(
              leading: Icon(
                Icons.grid_on,
                color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'Tom 1',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Mic : SHURE Box - Mini'),
              onTap: () {
                _showResult('24채널 12번', '24채널 1번');
                _returnCurrentChannel('Tom 1');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('Tom 1 Button is clicked.');
              }),
          ListTile(
              leading: Icon(
                Icons.grid_on,
                color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'Tom 2',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Mic : SHURE Box - Mini'),
              onTap: () {
                _showResult('24채널 13번', '24채널 1번');
                _returnCurrentChannel('Tom 2');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('Tom 2 Button is clicked.');
              }),
          ListTile(
              leading: Icon(
                Icons.grid_on,
                color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'Tom 3',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Mic : SHURE Box - Mini'),
              onTap: () {
                _showResult('24채널 14번', '24채널 1번');
                _returnCurrentChannel('Tom 3');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('Tom 3 Button is clicked.');
              }),
          ListTile(
              leading: Icon(
                Icons.grid_on,
                color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'Over Head L',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Mic : SHURE Box,\nDrummer가 앉은 기준으로 왼쪽'),
              onTap: () {
                _showResult('24채널 15번', '24채널 1번');
                _returnCurrentChannel('O.H L');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('Over Head L Button is clicked.');
              }),
          ListTile(
              leading: Icon(
                Icons.grid_on,
                color: Colors.grey[850],
              ),
              trailing: Image.asset(
                'assets/loading.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                'Over Head R',
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Mic : SHURE Box,\nDrummer가 앉은 기준으로 오른쪽'),
              onTap: () {
                _showResult('24채널 16번', '24채널 1번');
                _returnCurrentChannel('O.H R');

                setState(
                    () {}); //                          Navigator.of(context).pop();
                print('Over Head R Button is clicked.');
              }),
        ],
        itemExtent: 60.0,
      ),
    );
  }
}
