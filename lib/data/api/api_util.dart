import 'package:example/data/api/request/get_day_body.dart';
import 'package:example/data/api/service/sunrise_service.dart';
import 'package:example/data/mapper/day_mapper.dart';
import 'package:example/domain/model/day.dart';
import 'package:flutter/material.dart';

class ApiUtil {
  final SunriseService _sunriseService;

  ApiUtil(this._sunriseService);
  Future<Day> getDay({@required latitude, @required longtitude}) async {
    final body = GetDayBody(latitude: latitude, longtitude: longtitude);
    final result = await _sunriseService.getDay(body);
    return DayMapper.fromApi(result);
  }
}
