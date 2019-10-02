import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color grayColor = Color.fromRGBO(142, 142, 147, 1);
  Color grayTextColor = Color.fromRGBO(151, 151, 151, 1);
  Color activeColor = Color.fromRGBO(206, 12, 36, 1);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 12,
          child: Container(
            color: Color.fromRGBO(168, 0, 20, 1),
            height: 88,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 43.0),
              child: Container(
                alignment: Alignment.center,
                width: 105,
                height: 32,
                child: Image.asset(
                  'assets/img/logo.png',
                ),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 78,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 145,
                    height: 144,
                    child: Image.asset(
                      'assets/img/kitchenFoodDome.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    child: Text(
                      'NO ORDER AVAILABLE!',
                      style: TextStyle(
                          color: grayTextColor,
                          fontSize: 24,
                          fontFamily: 'WoodfordBourne',
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
