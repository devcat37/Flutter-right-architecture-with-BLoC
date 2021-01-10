import 'package:example/domain/model/day.dart';
import 'package:flutter/material.dart';

abstract class DayRepository {
  Future<Day> getDay({@required latitude, @required longtitude});
}
