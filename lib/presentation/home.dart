import 'package:example/domain/cubit/day_cubit.dart';
import 'package:example/domain/model/day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _latController = TextEditingController();
  final _lngController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus,
        child: Scaffold(
          body: _getBody(),
        ));
  }

  Widget _getBody() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: BlocBuilder<DayCubit, DayState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _getRowInput(),
                SizedBox(height: 20),
                RaisedButton(
                    child: Text('Получить'),
                    onPressed: () => context.read<DayCubit>().getDay(
                        double.parse(_latController.text),
                        double.parse(_lngController.text))),
                SizedBox(height: 20),
                if (state is DayLoaded) _getDayInfo(state.day),
                if (state is DayLoading) _loadingDay()
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _loadingDay() {
    return Container(
      alignment: Alignment.center,
      width: 50.0,
      height: 50.0,
      child: CircularProgressIndicator(),
    );
  }

  Widget _getRowInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _latController,
            keyboardType:
                TextInputType.numberWithOptions(decimal: true, signed: true),
            decoration: InputDecoration(hintText: 'Широта'),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: TextField(
            controller: _lngController,
            keyboardType:
                TextInputType.numberWithOptions(decimal: true, signed: true),
            decoration: InputDecoration(hintText: 'Долгота'),
          ),
        ),
      ],
    );
  }

  Widget _getDayInfo(Day day) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Восход: ${day.sunrise.toLocal()}'),
        Text('Заход: ${day.sunset.toLocal()}'),
        Text('Полдень: ${day.solarNoon.toLocal()}'),
        Text('Продолжительность: ${Duration(seconds: day.dayLength)}'),
      ],
    );
  }
}
