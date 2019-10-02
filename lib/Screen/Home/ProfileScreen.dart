import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hijack_flutter/Screen/Home/NotificationScreen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Color grayColor = Color.fromRGBO(243, 243, 243, 1);
  Color grayText = Color.fromRGBO(160, 160, 160, 1);
  Color hijackColor = Color.fromRGBO(208, 3, 27, 1);
  Color mainTextColor = Color.fromRGBO(74, 74, 74, 1);
  double eleHeight = 40.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: 171,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 43),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/img/oval@3x.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Douglas Larson',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        color: Color.fromRGBO(74, 74, 74, 1)),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - (171 + 83),
          child: ListView(
            padding: EdgeInsets.all(0.0),
            children: <Widget>[
            //Header Sub
              Container(
                color: grayColor,
                height: eleHeight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 37, top: 18),
                  child: Text("Payment & Invoice",
                      style: TextStyle(
                          color: grayText,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            //Payout
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border(bottom: BorderSide(width: 1, color: grayColor)),
                ),
                alignment: Alignment.centerLeft,
                height: eleHeight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 37),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ImageIcon(
                            AssetImage('assets/img/notificationCopy@3x.png'),
                            color: mainTextColor,
                            size: 14,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Text(
                              "Payout",
                              style: TextStyle(
                                  color: mainTextColor,
                                  fontSize: 14,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            //Invoice
              Container(
                alignment: Alignment.centerLeft,
                color: Colors.white,
                height: eleHeight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 37),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ImageIcon(
                            AssetImage('assets/img/notificationCopy2@3x.png'),
                            color: mainTextColor,
                            size: 14,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Text(
                              "Invoice",
                              style: TextStyle(
                                  color: mainTextColor,
                                  fontSize: 14,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            //Header Sub
              Container(
                color: grayColor,
                height: eleHeight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 37, top: 18),
                  child: Text("Account Settings",
                      style: TextStyle(
                          color: grayText,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            //Accounts Information
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border(bottom: BorderSide(width: 1, color: grayColor)),
                ),
                alignment: Alignment.centerLeft,
                height: eleHeight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 37),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ImageIcon(
                            AssetImage('assets/img/notificationCopy3@3x.png'),
                            color: mainTextColor,
                            size: 14,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Text(
                              "Account Information",
                              style: TextStyle(
                                  color: mainTextColor,
                                  fontSize: 14,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            //Notification
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border(bottom: BorderSide(width: 1, color: grayColor)),
                ),
                alignment: Alignment.centerLeft,
                height: eleHeight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 37),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ImageIcon(
                            AssetImage('assets/img/notification@3x.png'),
                            color: mainTextColor,
                            size: 14,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Text(
                              "Notification",
                              style: TextStyle(
                                  color: mainTextColor,
                                  fontSize: 14,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: CupertinoSwitch(
                          value: true,
                          onChanged: (value) {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            //Password
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                alignment: Alignment.centerLeft,
                height: eleHeight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 37),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ImageIcon(
                            AssetImage('assets/img/notificationCopy3@3x.png'),
                            color: mainTextColor,
                            size: 14,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  color: mainTextColor,
                                  fontSize: 14,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            //Header Sub
              Container(
                color: grayColor,
                height: eleHeight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 37, top:18),
                  child: Text("Support",
                      style: TextStyle(
                          color: grayText,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            //FAQ
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border(bottom: BorderSide(width: 1, color: grayColor)),
                ),
                alignment: Alignment.centerLeft,
                height: eleHeight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 37),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ImageIcon(
                            AssetImage('assets/img/notificationCopy4@3x.png'),
                            color: mainTextColor,
                            size: 14,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Text(
                              "FAQ",
                              style: TextStyle(
                                  color: mainTextColor,
                                  fontSize: 14,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            //Term and ...
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border(bottom: BorderSide(width: 1, color: grayColor)),
                ),
                alignment: Alignment.centerLeft,
                height: eleHeight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 37),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.dehaze,
                            color: mainTextColor,
                            size: 14,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Text(
                              "Terms & Conditions",
                              style: TextStyle(
                                  color: mainTextColor,
                                  fontSize: 14,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            //Privacy
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                alignment: Alignment.centerLeft,
                height: eleHeight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 37),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ImageIcon(
                            AssetImage('assets/img/notificationCopy5@3x.png'),
                            color: mainTextColor,
                            size: 14,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Text(
                              "Privacy Policy",
                              style: TextStyle(
                                  color: mainTextColor,
                                  fontSize: 14,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            //Logout
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  alignment: Alignment.centerLeft,
                  height: eleHeight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 37),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            ImageIcon(
                              AssetImage('assets/img/iconLogout@3x.png'),
                              color: hijackColor,
                              size: 14,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24.0),
                              child: Text(
                                "Logout",
                                style: TextStyle(
                                    color: hijackColor,
                                    fontSize: 14,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: hijackColor,
                            size: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),  
            ],
          ),
        )
      ],
    );
  }
}
