// enum OrderStatus{
//   delivering,
//   delivered,
//   confirmed,
//   ready,
//   cancelled,
//   none
// }
import 'package:flutter/material.dart';

class Orders {
  String statusText;
  Color statusColor;
  Orders(this.statusColor, this.statusText) {
    statusText = this.statusText;
    statusColor = this.statusColor;
  }
}
