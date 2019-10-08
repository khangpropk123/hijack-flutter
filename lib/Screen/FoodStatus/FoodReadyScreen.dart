import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hijack_flutter/Screen/Home/Utilities.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
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
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller = controller;
                    },
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
            flex: 45,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 45, left: 40),
                child: ListView(
                  padding: EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('14h45', style: foodReadyTimeStyle),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 15),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 15,
                                width: 15,
                                child: Image(
                                  image:
                                      AssetImage('assets/img/ovalCopy3@3x.png'),
                                ),
                              ),
                              Container(
                                height: 67,
                                width: 2,
                                color: hijackTextColor,
                              )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Receive Order',
                              style: foodReadyTitleStyle,
                            ),
                            Text('Accepted ')
                          ],
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '14h55',
                          style: foodReadyTimeStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 15),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 15,
                                width: 15,
                                child: Image(
                                  image:
                                      AssetImage('assets/img/ovalCopy3@3x.png'),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 2,
                                child: Image(
                                  image: AssetImage('assets/img/line2@3x.png'),
                                  fit: BoxFit.fill,
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Food Ready',
                              style: foodReadyTitleStyle,
                            ),
                            Text('')
                          ],
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '15h25',
                          style: TextStyle(color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 15),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 15,
                                width: 15,
                                child: Image(
                                  image: AssetImage('assets/img/oval5@3x.png'),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 2,
                                child: Image(
                                  image: AssetImage('assets/img/line2@3x.png'),
                                  fit: BoxFit.fill,
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Picked up',
                              style: foodReadyTitleStyle,
                            ),
                            Text('')
                          ],
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '15h25',
                          style: foodReadyTimeStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 15),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 15,
                                width: 15,
                                child: Image(
                                  image: AssetImage('assets/img/oval5@3x.png'),
                                ),
                              ),
                              Container(
                                height: 114,
                                width: 2,
                                child: Image(
                                  image: AssetImage('assets/img/line2@3x.png'),
                                  fit: BoxFit.fill,
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/img/oval@3x.png'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    'Hester Owen',
                                    style: foodReadyTitleStyle,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: mainTextColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 50,
                                  width: 191,
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 17.0),
                                        child: Icon(
                                          Icons.call,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 11.0),
                                        child: Text(
                                          "Call",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'OpenSans',
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 106.0),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '15h30',
                          style: foodReadyTimeStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 15),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 15,
                                width: 15,
                                child: Image(
                                  image: AssetImage('assets/img/oval6@3x.png'),
                                ),
                              ),
                              Container(
                                height: 1,
                                width: 2,
                                child: Image(
                                  image: AssetImage('assets/img/line2@3x.png'),
                                  fit: BoxFit.fill,
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Delivered',
                              style: foodReadyTitleStyle,
                            ),
                            Text('')
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                print(MediaQuery.of(context).size.height);
              },
              child: Container(
                padding: EdgeInsets.only(top: 15),
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                color: hijackTextColor,
                child: Text(
                  'PICKED UP',
                  style: foodPickedUpTitleStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
