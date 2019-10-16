import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hijack_flutter/API/LoginRequest.dart';
import 'package:hijack_flutter/Screen/Home/Utilities.dart';
import 'package:hijack_flutter/Screen/Login/ForgotPWScreen.dart';
import 'package:hijack_flutter/Screen/Home/MainScreen.dart';
import 'package:hijack_flutter/Screen/Login/TermsScreen.dart';
import 'package:location/location.dart';

//Import Flare
import 'package:flare_flutter/flare_actor.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username;
  String password;
  bool isFalse = false;
  bool isAnimation = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      username = "";
      password = "";
    });
  }

  handleLogin() async {
    Dio dio = new Dio();

    Location location = new Location();
    var loc = await location.getLocation();
    LatLng position = LatLng(loc.latitude, loc.longitude);
    LoginRequest login = new LoginRequest(
        username: username,
        password: password,
        email: username,
        devicetoken: "",
        platform: Platform.operatingSystem.toString(),
        position: position);
    var response = dio
        .post(login.APILogin,
            options: Options(
                followRedirects: false,
                validateStatus: (status) {
                  return status < 500;
                }),
            data: login.logindata())
        .then((res) {
      if (res.data["errors"] != null) {
        setState(() {
          isFalse = true;
        });
      } else {
        Navigator.of(context).pushReplacement(
            CupertinoPageRoute(builder: (context) => MainScreen()));
      }
      setState(() {
        isAnimation = false;
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isAnimation
          ? Loading()
          : Column(
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
                        padding: const EdgeInsets.only(left: 25, top: 80),
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
                        padding: const EdgeInsets.only(left: 25, top: 122),
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
                        padding: const EdgeInsets.only(left: 25, right: 25),
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
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 6.0,
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  child: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        username = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0)),
                                      ),
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
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 6.0,
                                ),
                                child: Container(
                                  height: !isFalse ? 50 : 70,
                                  child: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          password = value;
                                          isFalse = false;
                                        });
                                      },
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        errorText: !isFalse
                                            ? null
                                            : '⚠️ Current password is not right. Please check again',
                                        errorStyle: TextStyle(
                                            color:
                                                Color.fromRGBO(208, 2, 27, 1),
                                            fontSize: 12,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.bold),
                                        fillColor:
                                            Color.fromARGB(255, 246, 246, 246),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(0)),
                                        ),
                                      )),
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
                                padding: const EdgeInsets.only(top: 100.0),
                                child: Container(
                                  height: 50,
                                  width: 325,
                                  child: RaisedButton(
                                    color: (username == "" || password == "")
                                        ? Color.fromRGBO(234, 234, 234, 1)
                                        : hijackTextColor,
                                    child: Center(
                                      child: Text(
                                        "LOGIN",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isAnimation = true;
                                      });
                                      handleLogin();
                                      // Navigator.pushReplacement(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => MainScreen()));
                                      // Navigator.pushReplacement(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (contex) => MainScreen()));
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

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return FlareActor("assets/example/Loading.flr",
        alignment: Alignment.center, fit: BoxFit.contain, animation: "Alarm");
  }
}
