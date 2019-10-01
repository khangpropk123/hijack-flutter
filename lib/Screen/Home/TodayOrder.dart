import 'dart:math';

import 'package:flutter/material.dart';

class TodayOrderScreen extends StatefulWidget {
  @override
  _TodayOrderScreenState createState() => _TodayOrderScreenState();
}

class _TodayOrderScreenState extends State<TodayOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext contex,index){
        return Padding(
          padding: const EdgeInsets.only(top:20.0,left: 20,right: 20),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            color: RandColor(),
            child: Column(
              children: <Widget>[
               Expanded(
                 flex: 7,
                 child: Row(
                   children: <Widget>[
                     Expanded(
                       flex: 3,
                       child: Container(color: RandColor(),) ,
                     ),
                     Expanded(
                       flex: 7,
                       child: Container(color: RandColor(),),
                     ),
                   ],
                 ),
               ),
               Expanded(
                 flex: 2,
                 child: Container(
                   width: MediaQuery.of(context).size.width,
                   child: Container(
                     height: 34,
                     width: 335,
                     child: RaisedButton(
                       onPressed: (){},
                       child: Row(
                         children: <Widget>[
                           Expanded(
                             child: Container(
                               alignment: Alignment.centerLeft,
                               child: Text("TOTAL: 5 dishes",style: TextStyle(fontSize: 12,fontFamily: 'OpenSans',fontWeight: FontWeight.bold,),),
                             ),
                           ),
                           Expanded(
                             child: Container(
                               alignment: Alignment.centerRight,
                               child: Text("S"+'\$'+"1220.00",style: TextStyle(fontSize: 12,fontFamily: 'OpenSans',fontWeight: FontWeight.bold,color: Color.fromRGBO(208, 3, 27,1)),),
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                 ) ,
                 
               ),
              ],
            ),
          ),
        );

      },
      
    );
  }
}
Color RandColor(){
  Random rand = Random();
  return Color.fromRGBO(rand.nextInt(255), rand.nextInt(255), rand.nextInt(255), 1);
}