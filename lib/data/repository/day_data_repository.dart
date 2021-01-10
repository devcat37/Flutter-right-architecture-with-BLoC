import 'package:example/data/api/api_util.dart';
import 'package:example/domain/model/day.dart';
import 'package:example/domain/repository/day_repository.dart';

class DayDataRepository extends DayRepository {
  final ApiUtil _apiUtil;

  DayDataRepository(this._apiUtil);

  @override
  Future<Day> getDay({latitude, longtitude}) {
    return _apiUtil.getDay(latitude: latitude, longtitude: longtitude);
  }
}
