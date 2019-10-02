import 'dart:math';

import 'package:flutter/material.dart';

import 'Utilities.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Color dateTextColor = Color.fromRGBO(161, 161, 161, 1);
  Color titleColor = Color.fromRGBO(74, 74, 74, 1);
  List<Orders> orders;
  Color deliveringColor = Color.fromRGBO(65, 117, 5, 1);
  Color deliveredColor = Color.fromRGBO(80, 227, 194, 1);
  Color readyColor = Color.fromRGBO(74, 144, 226, 1);
  Color cancelledColor = Color.fromRGBO(168, 0, 20, 1);
  Color confirmedColor = Color.fromRGBO(245, 166, 35, 1);
  Orders order1, order2, order3, order4, order5;
  @override
  void initState() {
    super.initState();
    orders=[Orders(deliveringColor, "Delivering"),Orders(deliveredColor, "Delivered"),Orders(confirmedColor, "Confirmed"),Orders(readyColor, "Food Ready"),Orders(cancelledColor, "Cancelled"),];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(168, 0, 20, 1),
        centerTitle: false,
        title: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Notification",style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'WoodfordBourne',
                            fontWeight: FontWeight.bold,
                            color: Colors.white)
                            ),
              Text("Mark as Read",style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'OpenSans-SemiBold',
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            )
                            
                            ),
            ],
          ),
        ) ,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext contex,index){
          return Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1,color: dateTextColor)),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/example/ex_pizza.jpg') ,
                ),
                title: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(text: 'Order # 30758421 has been ',style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                              color: titleColor,)),
                    TextSpan(
                      text: orders[index].statusText,style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                              color: orders[index].statusColor,)
                    )
                  ]),
                ),
                subtitle: Text("25 Oct 2018", style: TextStyle(color: dateTextColor,fontSize: 12,fontFamily: 'OpenSans'),),
              ),
            ),
          );
        },
      ),
    );
  }
}
Color RandColor() {
  Random rand = Random();
  return Color.fromRGBO(
      rand.nextInt(255), rand.nextInt(255), rand.nextInt(255), 1);
}