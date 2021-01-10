import 'package:flutter/material.dart';

class GetDayBody {
  final double latitude;
  final double longtitude;

  GetDayBody({@required this.latitude, @required this.longtitude});

  Map<String, dynamic> toApi() {
    return {'lat': latitude, 'lng': longtitude, 'formatted': 0};
  }
}
