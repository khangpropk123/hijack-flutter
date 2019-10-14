import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hijack_flutter/Screen/Home/DeliveryDetailScreen.dart';
import 'Utilities.dart';

class TodayOrderScreen extends StatefulWidget {
  @override
  _TodayOrderScreenState createState() => _TodayOrderScreenState();
}

class _TodayOrderScreenState extends State<TodayOrderScreen> {
  Color textColor = Color.fromRGBO(74, 74, 74, 1);
  Color iconColor = Color.fromRGBO(160, 160, 160, 1);
  List<Orders> orders;
  Color deliveringColor = Color.fromRGBO(65, 117, 5, 1);
  Color deliveredColor = Color.fromRGBO(80, 227, 194, 1);
  Color readyColor = Color.fromRGBO(74, 144, 226, 1);
  Color cancelledColor = Color.fromRGBO(168, 0, 20, 1);
  Color confirmedColor = Color.fromRGBO(245, 166, 35, 1);
  Orders order1, order2, order3, order4, order5;
  @override
  void initState() {
    super.initState();
    orders = [
      Orders(deliveringColor, "• Delivering"),
      Orders(deliveredColor, "• Delivered"),
      Orders(confirmedColor, "• Confirmed"),
      Orders(readyColor, "• Food Ready"),
      Orders(cancelledColor, "• Cancelled"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
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
                                  orders[index].statusText,
                                  style: TextStyle(
                                      color: orders[index].statusColor,
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
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 1, color: iconColor))),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 34,
                            width: 335,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (context) =>
                                        DeliveryDetailScreen()));
                              },
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
                                            color:
                                                Color.fromRGBO(208, 3, 27, 1)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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

Color RandColor() {
  Random rand = Random();
  return Color.fromRGBO(
      rand.nextInt(255), rand.nextInt(255), rand.nextInt(255), 1);
}
