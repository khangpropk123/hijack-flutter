import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:dio/dio.dart';

class LoginRequest {
  String username;
  String password;
  String devicetoken;
  String email;
  LatLng position;
  String platform;
  LoginRequest(
      {this.username,
      this.password,
      this.devicetoken,
      this.email,
      this.platform,
      this.position});
  final APILogin = "https://staging.tacko.com/api/auth/signIn";
  FormData logindata() {
    FormData data = new FormData.fromMap({
      "username": username,
      "password": password,
      "grant_type": "password",
      "client_id": "2",
      "client_secret": "fOtoyx3BAzoKHjWRpwng4CPxQd1zYz88WiAZUlhW",
      "email": email,
      "device_platform": platform,
      "device_token": devicetoken,
      "longitude": position.longitude,
      "latitude": position.latitude
    });
    return data;
  }
}
