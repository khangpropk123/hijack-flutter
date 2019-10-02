import 'package:flutter/material.dart';
import 'package:hijack_flutter/Screen/Login/ForgotPWScreen.dart';
import 'package:hijack_flutter/Screen/Home/HomeScreen.dart';
import 'package:hijack_flutter/Screen/Home/MainScreen.dart';
import 'package:hijack_flutter/Screen/Login/LoginScreen.dart';
import 'package:hijack_flutter/Screen/Login/TermsScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hijack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Hijack Food Delivery'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
