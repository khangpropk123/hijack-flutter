import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hijack_flutter/Screen/Home/AccountInfoScreen.dart';
import 'package:hijack_flutter/Screen/Home/HistoryOrderScreen.dart';
import 'package:hijack_flutter/Screen/Home/HomeScreen.dart';
import 'package:hijack_flutter/Screen/Home/NotificationScreen.dart';
import 'package:hijack_flutter/Screen/Home/ProfileScreen.dart';
import 'package:hijack_flutter/Screen/Home/TodayOrder.dart';
import 'package:hijack_flutter/Screen/Home/Utilities.dart';

int widSelected = 0;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int narbarSelected = 0;
  int appbarSelected = 0;
  Color grayColor = Color.fromRGBO(142, 142, 147, 1);
  Color grayTextColor = Color.fromRGBO(151, 151, 151, 1);
  Color activeColor = Color.fromRGBO(206, 12, 36, 1);
  Color mainTextColor = Color.fromRGBO(168, 0, 20, 1);
  List<Widget> widgetMain = <Widget>[
    HomeScreen(),
    TodayOrderScreen(),
    NotificationScreen(),
    ProfileScreen(),
    HistoryOrderScreen(),
    AccountInfoScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: narbarSelected == 1
            ? AppBar(
                backgroundColor: Color.fromRGBO(168, 0, 20, 1),
                title: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            setState(() {
                              appbarSelected = 0;
                              widSelected = 1;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 101,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Today Order',
                                        style: TextStyle(
                                            color: appbarSelected == 0
                                                ? Colors.white
                                                : Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'OpenSans'),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16),
                                        child: Container(
                                          width: 15,
                                          height: 20,
                                          color: appbarSelected == 0
                                              ? Colors.white
                                              : Colors.grey,
                                          child: Center(
                                              child: Text(
                                            '5',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: mainTextColor,
                                                fontFamily: 'OpenSans'),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Container(
                                    height: 3,
                                    width: 101,
                                    color: appbarSelected == 0
                                        ? Colors.white
                                        : activeColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            setState(() {
                              appbarSelected = 1;
                              widSelected = 4;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 101,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          height: 18,
                                          child: Text(
                                            'History Delivery',
                                            style: TextStyle(
                                                color: appbarSelected == 1
                                                    ? Colors.white
                                                    : Colors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'OpenSans'),
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0),
                                  child: Container(
                                    height: 3,
                                    width: 101,
                                    color: appbarSelected == 1
                                        ? Colors.white
                                        : activeColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : null,
        body: StreamBuilder(
          initialData: 0,
          stream: mainScreenControler.stream,
          builder: (BuildContext contex, snapshot) {
            return widgetMain.elementAt(snapshot.data);
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: narbarSelected,
          onTap: (index) {
            setState(() {
              narbarSelected = index;
              mainScreenControler.sink.add(narbarSelected);
              appbarSelected = 0;
            });
          },
          selectedLabelStyle: TextStyle(color: activeColor),
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.home, color: activeColor),
                icon: Icon(Icons.home, color: grayColor),
                title: new Text('Home',
                    style: narbarSelected != 0
                        ? TextStyle(color: grayColor, fontSize: 10)
                        : TextStyle(color: activeColor, fontSize: 10))),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.receipt, color: activeColor),
                icon: Icon(Icons.receipt, color: grayColor),
                title: new Text('Order',
                    style: narbarSelected != 1
                        ? TextStyle(color: grayColor, fontSize: 10)
                        : TextStyle(color: activeColor, fontSize: 10))),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.notifications, color: activeColor),
                icon: Icon(Icons.notifications, color: grayColor),
                title: new Text('Notification',
                    style: narbarSelected != 2
                        ? TextStyle(color: grayColor, fontSize: 10)
                        : TextStyle(color: activeColor, fontSize: 10))),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.person, color: activeColor),
                icon: Icon(Icons.person, color: grayColor),
                title: new Text('Profile',
                    style: narbarSelected != 3
                        ? TextStyle(color: grayColor, fontSize: 10)
                        : TextStyle(color: activeColor, fontSize: 10)))
          ],
        ));
  }
}
