import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hijack_flutter/Screen/Home/Utilities.dart';

class FAQScreen extends StatefulWidget {
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'FAQ',
            style: TextStyle(
                fontFamily: 'WoodfordBourne',
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          backgroundColor: hijackTextColor,
        ),
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                FAQItem(
                  title: 'What is HiJack Food',
                  content: '',
                ),
                FAQItem(
                  title: "How does Hijack food work?",
                  content:
                      "Pre-order: You can log onto delivery app or Hijack food website. Merchants food menu will be displayed as part of Hijack food offering.\n\nOrder: You can place order from different merchants located under HiJack food website.\n\nDelivery: You can receive your order within 30 mins.\n\nCustomer support: If there is any problem regarding your order, you can contact our customer service team @ 123456.",
                ),
                FAQItem(
                  title: "How can customers order from Hijack food?",
                  content: "",
                ),
                FAQItem(
                  title:
                      "What is the charges comparing to the same restaurant selling in store and online in Hijack food?",
                  content: "",
                ),
                FAQItem(
                  title:
                      "Can I order from different food brands at the same time?",
                  content:
                      'Yes you can order different food brands under Hijack platform at the same time.',
                ),
                FAQItem(
                  title: "Can I place orders in advance?",
                  content: "",
                ),
                FAQItem(
                  title: "How do I pay for Hijack food delivery?",
                  content: "",
                ),
                FAQItem(
                  title: "What If Something Is Wrong with My Order?",
                  content: "",
                ),
                FAQItem(
                  title: "How do I check my order status?",
                  content: "",
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    'Food partners FAQ',
                    style: TextStyle(
                        fontSize: 14,
                        color: mainTextColor,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: FAQItem(
                      title: "Can I become a Hijack food merchant?",
                      content:
                          "This is considered an error condition because it indicates that there is content that cannot be seen. If the content is legitimately bigger than the available space, consider clipping it with a ClipRect widget before putting it in the flex, or using a scrollable container rather than a Flex, like a ListView.",
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
