import 'package:flutter/material.dart';
import 'package:hijack_flutter/Screen/Home/Utilities.dart';

class ChangePassScreen extends StatefulWidget {
  ChangePassScreen({Key key}) : super(key: key);

  _ChangePassScreenState createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isValid = false;
  bool isCurentPass = true;
  TextEditingController currentPassctl;
  TextEditingController newPassctl;
  TextEditingController confirmPassctl;
  String curentPass, newPass, confirmPass;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: hijackColor,
        centerTitle: false,
        title: Text(
          'Change Password',
          style: TextStyle(
              fontFamily: 'WoodfordBourne',
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Padding(
              padding: const EdgeInsets.only(top: 27.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Current Password',
                      style: TextStyle(
                          color: mainTextColor,
                          fontSize: 12,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 6.0,
                    ),
                    child: Container(
                      height: isCurentPass ? 50 : 80,
                      child: TextFormField(
                        key: _formKey,
                        onChanged: (value) {
                          setState(() {
                            curentPass = value;
                          });
                        },
                        obscureText: true,
                        controller: currentPassctl,
                        style: TextStyle(
                            color: mainTextColor,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          errorText: isCurentPass
                              ? null
                              : '⚠️ Current password is not right. Please check again',
                          errorStyle: TextStyle(
                              color: Color.fromRGBO(208, 2, 27, 1),
                              fontSize: 12,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 14),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'New Password',
                      style: TextStyle(
                          color: mainTextColor,
                          fontSize: 12,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 6.0,
                    ),
                    child: Container(
                      height: 50,
                      child: TextField(
                        obscureText: true,
                        controller: newPassctl,
                        onChanged: (value) {
                          setState(() {
                            newPass = value;
                          });
                        },
                        style: TextStyle(
                            color: mainTextColor,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          suffixIcon: isValid
                              ? Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                )
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      'Minimum 8 Characters, at least 1 number required',
                      style: TextStyle(
                          color: mainTextColor,
                          fontSize: 10,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 14),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Confirm New Password',
                      style: TextStyle(
                          color: mainTextColor,
                          fontSize: 12,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Container(
                      child: TextFormField(
                        controller: confirmPassctl,
                        obscureText: true,
                        onChanged: (value) {
                          print(value);
                          if (Validate(newPass, value)) {
                            setState(() {
                              print(confirmPass);
                              isValid = true;
                            });
                          } else {
                            setState(() {
                              print(confirmPass);
                              isValid = false;
                            });
                          }
                        },
                        style: TextStyle(
                            color: mainTextColor,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          suffixIcon: isValid
                              ? Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                )
                              : null,
                          errorStyle: TextStyle(
                              color: Color.fromRGBO(208, 2, 27, 1),
                              fontSize: 12,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold),
                          errorText: !isValid
                              ? '⚠️ Confirm password is not match. Please check again'
                              : null,
                          contentPadding: EdgeInsets.all(15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 91.0),
                    child: Container(
                      height: 50,
                      width: 325,
                      child: RaisedButton(
                        color: isValid
                            ? hijackColor
                            : Color.fromRGBO(234, 234, 234, 1),
                        child: Center(
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        onPressed: isValid
                            ? () {
                                if (curentPass == '123456') {
                                  setState(() {
                                    isCurentPass = true;
                                  });
                                } else {
                                  setState(() {
                                    isCurentPass = false;
                                  });
                                }
                              }
                            : () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
