import 'dart:math';

import 'package:flutter/material.dart';

class HistoryOrderScreen extends StatefulWidget {
  @override
  _HistoryOrderScreen createState() => _HistoryOrderScreen();
}

class _HistoryOrderScreen extends State<HistoryOrderScreen> {
  Color textColor = Color.fromRGBO(74, 74, 74, 1);
  Color iconColor = Color.fromRGBO(160, 160, 160, 1);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext contex, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            height: 70,
                            child: Image.asset(
                              'assets/example/ex_pizza.jpg',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    child: Text(
                                  "Order #1234599052",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.bold),
                                )),
                                Text(
                                  '• Delivering',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 9.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.watch_later,
                                    size: 12,
                                    color: iconColor,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 9),
                                    child: Text(
                                      '15:00',
                                      style: TextStyle(
                                          color: textColor,
                                          fontSize: 12,
                                          fontFamily: 'OpenSans',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7.0),
                              child: Row(
                                children: <Widget>[
                                  ImageIcon(
                                    AssetImage('assets/img/time@3x.png'),
                                    size: 12,
                                    color: iconColor,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 9),
                                    child: Text(
                                      'Yara Barros',
                                      style: TextStyle(
                                          color: textColor,
                                          fontSize: 12,
                                          fontFamily: 'OpenSans',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.room,
                                    size: 12,
                                    color: iconColor,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 9),
                                      child: Wrap(
                                        children: <Widget>[
                                          RichText(
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            text: TextSpan(
                                              text:
                                                  '13 Kranji Loop Singapore 739546, Singapore',
                                              style: TextStyle(
                                                  color: textColor,
                                                  fontSize: 12,
                                                  fontFamily: 'OpenSans',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    height: 20,
                                    width: 5,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/img/line2@3x.png'))),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.room,
                                    size: 12,
                                    color: iconColor,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 9),
                                      child: Wrap(
                                        children: <Widget>[
                                          RichText(
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            text: TextSpan(
                                              text:
                                                  '171 tras street 04-171a union building, 079025, Singapore',
                                              style: TextStyle(
                                                  color: textColor,
                                                  fontSize: 12,
                                                  fontFamily: 'OpenSans',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        height: 34,
                        width: 335,
                        child: RaisedButton(
                          onPressed: () {},
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "TOTAL: 5 dishes",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "S" + '\$' + "1220.00",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(208, 3, 27, 1)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
