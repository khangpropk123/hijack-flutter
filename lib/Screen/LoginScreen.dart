import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hijack_flutter/Screen/ForgotPWScreen.dart';
import 'package:hijack_flutter/Screen/Home/MainScreen.dart';
import 'package:hijack_flutter/Screen/TermsScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/img/img.png'),
                          fit: BoxFit.fitWidth)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 80, 45, 55),
                  child: Container(
                    height: 45,
                    width: 311,
                    child: Text(
                      'Welcome back!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontFamily: 'WoodfordBourne',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 122, 59, 16),
                  child: Container(
                    width: 270,
                    child: Text(
                      'Sigin in with your account and delivery with us now!',
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.white,
                          height: 1.5,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 632,
            width: MediaQuery.of(context).size.width,
            child: Column(
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
                            'Email',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 325,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 6.0,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Password',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 325,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 6.0,
                            ),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor: Color.fromARGB(255, 246, 246, 246),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPWScreen()));
                              },
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'OpenSans-SemiBold',
                                  color: Color.fromRGBO(168, 0, 20, 1),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 215.0),
                          child: Container(
                            height: 50,
                            width: 325,
                            child: RaisedButton(
                              color: Color.fromRGBO(234, 234, 234, 1),
                              child: Center(
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              onPressed: () { 
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (contex)=>MainScreen()));
                              },
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 81.0),
                            child: Text(
                              'By resgitered, you’re agree with our',
                              style: TextStyle(
                                  color: Color.fromRGBO(74, 74, 74, 1)),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (contex) => TermsScreen()));
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Text(
                                'TERMS & CONDITIONS',
                                style: TextStyle(
                                    color: Color.fromRGBO(168, 0, 20, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
