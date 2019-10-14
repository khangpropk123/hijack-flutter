import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hijack_flutter/Screen/Draw/Draw.dart';
import 'package:hijack_flutter/Screen/Home/Utilities.dart';
import 'package:hijack_flutter/Screen/Request/DirectionRequest.dart';
import 'package:hijack_flutter/Classes/OrderDetailClass.dart';
import 'package:hijack_flutter/Screen/FoodStatus/FoodReadyScreen.dart';

class DeliveryDetailScreen extends StatefulWidget {
  @override
  State<DeliveryDetailScreen> createState() => DeliveryDetailState();
}

class DeliveryDetailState extends State<DeliveryDetailScreen> {
  GoogleMapController _controller;
  LatLng psde = LatLng(10.802615, 106.654846);
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(10.802615, 106.654846),
    zoom: 15,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(10.802615, 106.654846),
      tilt: 59.440717697143555,
      zoom: 14.7877878768);
  BitmapDescriptor _markerIcon;
  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    final ImageConfiguration imageConfiguration =
        createLocalImageConfiguration(context, size: Size(1000, 1000));
    BitmapDescriptor.fromAssetImage(
            imageConfiguration, 'assets/img/group22@3x.png')
        .then(_updateBitmap);
  }

  void _updateBitmap(BitmapDescriptor bitmap) {
    setState(() {
      _markerIcon = bitmap;
    });
  }

  Set<Marker> createMarker(LatLng positsion) {
    return <Marker>[
      Marker(
          markerId: MarkerId('id_1'), position: positsion, icon: _markerIcon),
    ].toSet();
  }

  Set<Polyline> _polylines = {};
  List<LatLng> latlng = [
    LatLng(10.802615, 106.654846),
    LatLng(10.788051, 106.713195),
  ];
  void onGo() {
    setState(() {
      _polylines.add(Polyline(
        polylineId: PolylineId("Home"),
        visible: true,
        points: latlng,
        color: Colors.red,
      ));
    });
  }

  GoogleMapsServices ggService = new GoogleMapsServices();
  List<int> itemcount = [1, 2, 3, 5, 3];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _createMarkerImageFromAsset(context);
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 35,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    myLocationButtonEnabled: false,
                    myLocationEnabled: true,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller = controller;
                    },
                    polylines: _polylines,
                    markers: createMarker(psde),
                    onTap: (position) {
                      setState(() {
                        psde = position;
                      });
                    },
                  ),
                ),
                Positioned(
                  top: 45,
                  left: 20,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Image(
                        image: AssetImage('assets/img/back@3x.png'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 55,
            child: Container(
              color: Colors.white,
              child: ListView.separated(
                padding: EdgeInsets.all(0.0),
                itemCount: itemcount.length,
                itemBuilder: (BuildContext contex, index) {
                  if (index == 0) {
                    return Column(
                      children: <Widget>[
                        DetailWidget(
                          id: "#BG5560",
                          name: "Hester Owen",
                          time: "15:00",
                          date: "20/11/2018",
                          from: "L’opera Restaurant",
                          subfrom: "1194 Crist Camp Suite 453",
                          to: "0681 Eleanora Village Suite 427",
                          subto: "1194 Crist Camp Suite 453",
                          note:
                              "Pre-order: You can log onto delivery app or Hijack food website.",
                        ),
                        Container(
                            height: 10,
                            width: MediaQuery.of(context).size.width,
                            color: Color.fromRGBO(234, 234, 234, 1))
                      ],
                    );
                  }
                  if (index == itemcount.length - 1)
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 17),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "VAT tax",
                                style: foodReadyTitleStyle,
                              ),
                              Text("S\$10.00",
                                  style: TextStyle(
                                      color: mainTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "OpenSans",
                                      fontSize: 14))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Discount", style: foodReadyTitleStyle),
                              Text("- S\$50.000",
                                  style: TextStyle(
                                      color: mainTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "OpenSans",
                                      fontSize: 12))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 6, bottom: 17),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Shipping fee", style: foodReadyTitleStyle),
                              Text("S\$5.00",
                                  style: TextStyle(
                                      color: mainTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "OpenSans",
                                      fontSize: 12))
                            ],
                          ),
                        ),
                        Divider(
                          indent: 20,
                          endIndent: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 17),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(""),
                              Text("7 dishes",
                                  style: TextStyle(
                                      color: mainTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "OpenSans",
                                      fontSize: 12))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 2, bottom: 17),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("TOTAL", style: foodReadyTitleStyle),
                              Text(
                                "S\$1220.00",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: "WoodfordBourne",
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(208, 3, 27, 1)),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FoodReadyScreen()));
                          },
                          child: Container(
                            height: 90,
                            padding: EdgeInsets.only(top: 15, right: 20),
                            alignment: Alignment.topCenter,
                            width: MediaQuery.of(context).size.width,
                            color: hijackTextColor,
                            child: Text(
                              'CONFIRM',
                              style: foodPickedUpTitleStyle,
                            ),
                          ),
                        )
                      ],
                    );
                  else
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 110,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20.0, right: 10),
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/example/ex_pizza.jpg"),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(
                                      child: Container(
                                    height: 45,
                                    width:
                                        MediaQuery.of(context).size.width - 130,
                                    child: Text(
                                      "Crispy Sesame Chicken with a Sticky Asian Sauce ",
                                      style: foodReadyTitleStyle,
                                    ),
                                  )),
                                  Container(
                                    height: 45,
                                    width:
                                        MediaQuery.of(context).size.width - 130,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "1 x S\$200.00",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(208, 3, 27, 1),
                                              fontSize: 12,
                                              fontFamily: "OpenSans",
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "S\$200.00",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(208, 3, 27, 1),
                                              fontSize: 12,
                                              fontFamily: "OpenSans",
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    indent: 20,
                    endIndent: 20,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailWidget extends StatelessWidget {
  String id;
  String name;
  String time;
  String date;
  String from;
  String subfrom = "";
  String to;
  String subto = "";
  String note;
  DetailWidget(
      {this.id,
      this.name,
      this.time,
      this.date,
      this.from,
      this.subfrom,
      this.subto,
      this.to,
      this.note});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 23, left: 21, right: 21),
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            height: 13,
                            child: ImageIcon(
                                AssetImage('assets/img/cart@3x.png'))),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text("Order ID"),
                        )
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 40.0, top: 10),
                        child: Text(
                          id,
                          style: foodReadyTitleStyle,
                        ))
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            height: 13,
                            child: ImageIcon(
                                AssetImage('assets/img/iconprofile@3x.png'))),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                          ),
                          child: Text("Client Name"),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0, top: 10),
                      child: Text(name, style: foodReadyTitleStyle),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            height: 13,
                            child: ImageIcon(
                                AssetImage('assets/img/icontime@3x.png'))),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text("Time"),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0, top: 10),
                      child: Text("$time | $date", style: foodReadyTitleStyle),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            height: 13,
                            child: ImageIcon(
                                AssetImage('assets/img/iconhome@3x.png'))),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text("Deliver to"),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, top: 20.5),
                          child: Container(
                              height: 6,
                              child: ImageIcon(
                                  AssetImage('assets/img/ovalblack@3x.png'))),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 11),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(from, style: foodReadyTitleStyle),
                              ],
                            )),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 0, bottom: 0),
                          child: Container(
                            height: 50,
                            width: 4,
                            child: Image(
                              image: AssetImage('assets/img/line2@3x.png'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 25),
                          child: Text(subfrom),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, top: 05),
                          child: Container(
                              height: 6,
                              child: ImageIcon(
                                  AssetImage('assets/img/ovalblack@3x.png'))),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(to, style: foodReadyTitleStyle),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8.0, left: 0),
                                  child: Text(subto),
                                )
                              ],
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                      height: 13,
                                      child: ImageIcon(AssetImage(
                                          'assets/img/news@3x.png'))),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text("NOTE FOR YOUR DRIVER"),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 40.0, top: 10),
                                child: Container(
                                  height: 60,
                                  width: 290,
                                  child: ListView(
                                    padding: EdgeInsets.all(0),
                                    children: <Widget>[
                                      Text(note, style: foodReadyTitleStyle),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
