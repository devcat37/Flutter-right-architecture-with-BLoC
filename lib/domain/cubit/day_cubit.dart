import 'package:bloc/bloc.dart';
import 'package:example/domain/model/day.dart';
import 'package:example/domain/repository/day_repository.dart';
import 'package:meta/meta.dart';

part 'day_state.dart';

class DayCubit extends Cubit<DayState> {
  final DayRepository _dayRepository;

  DayCubit(this._dayRepository) : super(DayInitial());

  Future<void> getDay(double latitude, double longtitude) async {
    emit(DayLoading());
    final day =
        await _dayRepository.getDay(latitude: latitude, longtitude: longtitude);
    emit(DayLoaded(day));
  }
}
