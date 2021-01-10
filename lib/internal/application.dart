import 'package:example/data/api/api_util.dart';
import 'package:example/data/api/service/sunrise_service.dart';
import 'package:example/data/repository/day_data_repository.dart';
import 'package:example/domain/cubit/day_cubit.dart';
import 'package:example/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BlocProvider(
          create: (context) =>
              DayCubit(DayDataRepository(ApiUtil(SunriseService()))),
          child: Home(),
        ));
  }
}
