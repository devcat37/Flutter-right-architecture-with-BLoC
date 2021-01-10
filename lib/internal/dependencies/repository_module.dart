import 'package:example/data/repository/day_data_repository.dart';
import 'package:example/domain/repository/day_repository.dart';
import 'package:example/internal/dependencies/api_module.dart';

class RepositoryModule {
  static DayRepository _dayRepository;

  static DayRepository dayRepository() {
    if (_dayRepository == null) {
      _dayRepository = DayDataRepository(ApiModule.apiUtil());
    }
    return _dayRepository;
  }
}
