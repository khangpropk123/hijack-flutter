// enum OrderStatus{
//   delivering,
//   delivered,
//   confirmed,
//   ready,
//   cancelled,
//   none
// }
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color grayColor = Color.fromRGBO(243, 243, 243, 1);
Color grayText = Color.fromRGBO(160, 160, 160, 1);
Color hijackColor = Color.fromRGBO(208, 3, 27, 1);
Color mainTextColor = Color.fromRGBO(74, 74, 74, 1);
Color hijackTextColor = Color.fromRGBO(168, 0, 20, 1);
StreamController<int> mainScreenControler = StreamController.broadcast();

class Orders {
  String statusText;
  Color statusColor;
  Orders(this.statusColor, this.statusText) {
    statusText = this.statusText;
    statusColor = this.statusColor;
  }
}

bool Validate(String str, String val) {
  if (str == val) return true;
  return false;
}

saveStringToSF(String keyValue, String path) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(keyValue, path);
}

Future<String> getStringFromPF(String keyValue) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String path = prefs.getString(keyValue);
  return path;
}

class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = new StringBuffer();

    if (newTextLength >= 1) {
      newText.write('+');
      if (newValue.text.substring(0, 1) == '0') {
        newText.write('84');
        selectionIndex += 3;
        usedSubstringIndex = 3;
      }
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    print(newValue.text);
    if (newTextLength >= 3) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 2) + ' ');
      if (newValue.selection.end >= 2) selectionIndex += 1;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return new TextEditingValue(
      text: newText.toString(),
      selection: new TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

// ExpansionItem
class FAQItem extends StatelessWidget {
  final String title;
  final String content;
  FAQItem({this.title, this.content});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        initiallyExpanded: false,
        leading: ImageIcon(
          AssetImage('assets/img/info@3x.png'),
          size: 18,
          color: mainTextColor,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                    color: mainTextColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                    fontSize: 14),
              ),
            )
          ],
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Text(
              content,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: mainTextColor),
            ),
          )
        ],
      ),
    );
  }
}

TextStyle foodReadyTimeStyle = TextStyle(
    color: mainTextColor, fontFamily: 'OpenSans', fontWeight: FontWeight.bold);
TextStyle foodReadyTitleStyle = TextStyle(
    color: mainTextColor,
    fontFamily: 'OpenSans',
    fontSize: 14,
    fontWeight: FontWeight.bold);
TextStyle foodPickedUpTitleStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'OpenSans',
    fontSize: 14,
    fontWeight: FontWeight.bold);
