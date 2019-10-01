import 'package:flutter/material.dart';

class ForgotPWScreen extends StatefulWidget {
  @override
  _ForgotPWScreenState createState() => _ForgotPWScreenState();
}

class _ForgotPWScreenState extends State<ForgotPWScreen> {
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
                  padding: const EdgeInsets.only(top: 41.2, left: 14.6),
                  child: Container(
                    height: 30,
                    width: 30,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 80, 45, 55),
                  child: Container(
                    height: 45,
                    width: 311,
                    child: Text(
                      'Forgot Password?',
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
                      'Don’t remember your password? Tell us your email!',
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
                        Padding(
                          padding: const EdgeInsets.only(top: 91.0),
                          child: Container(
                            height: 50,
                            width: 325,
                            child: RaisedButton(
                              color: Color.fromRGBO(234, 234, 234, 1),
                              child: Center(
                                child: Text(
                                  "SUBMIT",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
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
