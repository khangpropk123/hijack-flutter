import 'package:flutter/material.dart';

class TermsScreen extends StatefulWidget {
  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  Color textColor = Color.fromRGBO(74, 74, 74, 1);
  Color hijackColor = Color.fromRGBO(168, 0, 20, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            color: hijackColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 62),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        },
                      child: Container(
                        height: 25,
                        width: 25,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Terms and Conditions of Service",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'WoodfordBourne',
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  )
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 19, right: 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 288,
                          width: 335,
                          child: RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  style:
                                      TextStyle(color: textColor, height: 1.1),
                                  text:
                                      "Welcome to Hijackfood.com.sg website and our applications (each our &quot;Service&quot;). This page (together with the documents referred to on it) tells you the terms and conditions on which our partner restaurants supply any of their meals (the &quot;Meals&quot;) listed on our site to you. Please read these terms and conditions carefully before ordering any Meals from our site. By accessing our site and placing an order you agreed to be bound by these terms and conditions and our terms of use policy."),
                              TextSpan(children: <TextSpan>[
                                TextSpan(
                                    style: TextStyle(
                                        color: textColor, height: 1.1),
                                    text:
                                        "\n\nIf you have any questions relating to these terms and conditions, please "),
                                TextSpan(
                                  style: TextStyle(
                                      color: hijackColor, height: 1.1),
                                  text: "\ncontact support@hijackfood.com.sg",
                                ),
                                TextSpan(
                                  style:
                                      TextStyle(color: textColor, height: 1.1),
                                  text:
                                      " before you place an order. If you do not accept these terms and conditions in full please do not use our Service.",
                                )
                              ])
                            ]),
                          ),
                        ),
                        Container(
                          width: 335,
                          child: RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: '1. Information About Us',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                style: TextStyle(color: textColor, height: 1.1),
                                text:
                                    "\n\nHiJackFood.com.sg is a website operated by HiJack Food Pte Ltd incorporated and registered in the Republic of Singapore. HiJack Food is a business where the food is prepared by independent restaurants in our central kitchen and deliver by us or by others food delivery operators.",
                              ),
                              TextSpan(
                                  text: '\n\n2. Purpose',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                style: TextStyle(color: textColor, height: 1.1),
                                text:
                                    "\n\nThe purpose of our Service is to provide a simple and convenient service to you, linking you to the Partner Restaurant and menu of their choice and allowing you to order Meals from them. HiJack food markets Meals on behalf of our Partner Restaurants, concludes orders on their behalf and delivers the Meals to you.",
                              ),
                            ]),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
