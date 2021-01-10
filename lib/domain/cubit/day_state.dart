part of 'day_cubit.dart';

@immutable
abstract class DayState {
  const DayState();
}

class DayInitial extends DayState {
  const DayInitial();
}

class DayLoading extends DayState {
  const DayLoading();
}

class DayLoaded extends DayState {
  final Day day;
  const DayLoaded(this.day);
}

class DayError extends DayState {
  final String message;
  const DayError(this.message);
}
