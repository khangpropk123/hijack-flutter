import 'dart:io';
import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hijack_flutter/Screen/Home/MainScreen.dart';
import 'package:hijack_flutter/Screen/Home/Utilities.dart';
import 'package:image_picker/image_picker.dart';

class AccountInfoScreen extends StatefulWidget {
  @override
  _AccountInfoScreenState createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  final _phoneFormater = NumberTextInputFormatter();
  String txtNumberPhone = '';
  bool isPhone = true;
  File avatar;
  String avatarPath;
  String path;
  //Get Image
  getPath() async {
    path = await getStringFromPF('avatarPath');
    print(path);
    if (path != null && File(path).existsSync()) {
      setState(() {
        avatar = File(path);
      });
    } else {
      setState(() {
        avatar = null;
      });
    }
  }

  Future getImageFromCam() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      avatar = image;
      saveStringToSF('avatarPath', image.path.toString());
    });
  }

  Future getImageFromGal() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      avatar = image;
      avatarPath = image.path.toString();
      saveStringToSF('avatarPath', image.path.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    getPath();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 25,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: SafeArea(
                  bottom: false,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: CircleAvatar(
                              maxRadius: 50,
                              minRadius: 40,
                              backgroundImage: avatar == null
                                  ? AssetImage('assets/img/oval@3x.png')
                                  : FileImage(avatar),
                            ),
                          ),
                          Flexible(
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        CupertinoActionSheet(
                                            title:
                                                Text('Change Profile Picture'),
                                            actions: <Widget>[
                                              CupertinoActionSheetAction(
                                                child: const Text(
                                                    'Choose photo from Library'),
                                                onPressed: () async {
                                                  await getImageFromGal();
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              CupertinoActionSheetAction(
                                                child:
                                                    const Text('Capture Image'),
                                                onPressed: () async {
                                                  await getImageFromCam();
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                            cancelButton:
                                                CupertinoActionSheetAction(
                                              child: const Text('Cancel'),
                                              isDefaultAction: true,
                                              onPressed: () {
                                                Navigator.pop(
                                                    context, 'Cancel');
                                              },
                                            )));
                              },
                              child: Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Change Profile Picture',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 12,
                                        color: hijackTextColor,
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        top: 25,
                        left: 10,
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            mainScreenControler.sink.add(3);
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              child: Icon(Icons.arrow_back_ios)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 65,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Column(
                  children: <Widget>[
                    //Firstname header
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Firstname',
                        style: TextStyle(
                            color: mainTextColor,
                            fontSize: 12,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    //Firsname Input
                    Container(
                      padding: EdgeInsets.only(top: 6),
                      height: 50,
                      child: TextFormField(
                        style: TextStyle(
                            color: mainTextColor,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
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
                    //Lastname Header
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Lastname',
                        style: TextStyle(
                            color: mainTextColor,
                            fontSize: 12,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    //Lastname Input
                    Container(
                      padding: EdgeInsets.only(top: 6),
                      height: 50,
                      child: TextFormField(
                        style: TextStyle(
                            color: mainTextColor,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
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
                    //Email Header
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email',
                        style: TextStyle(
                            color: mainTextColor,
                            fontSize: 12,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    //Email Input
                    Container(
                      padding: EdgeInsets.only(top: 6),
                      height: 50,
                      child: TextFormField(
                        style: TextStyle(
                            color: mainTextColor,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
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
                    //Phone Header
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Phone Number',
                        style: TextStyle(
                            color: mainTextColor,
                            fontSize: 12,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    //Phone Input
                    Container(
                      padding: EdgeInsets.only(top: 6),
                      height: isPhone ? 70 : 80,
                      child: TextFormField(
                        maxLength: 13,
                        keyboardType: TextInputType.phone,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly,
                          _phoneFormater
                        ],
                        onChanged: (value) {
                          setState(() {
                            txtNumberPhone = value;
                            if (value.length < 13) {
                              isPhone = false;
                            } else {
                              isPhone = true;
                            }
                          });
                        },
                        style: TextStyle(
                            color: mainTextColor,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          errorText:
                              isPhone ? null : 'Wrong phone number format!',
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
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 30),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  color: hijackTextColor,
                  child: Text(
                    'SAVE CHANGES',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
