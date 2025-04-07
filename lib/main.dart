import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  backgroundColor: getThemeColour(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition,
                  ),
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColour(String? condition) {
  if (condition == null) {
    return Colors.blue;
  } else if (condition.toLowerCase() == 'sunny') {
    return Colors.amber; // MaterialColor
  } else if (condition.toLowerCase() == 'partly cloudy') {
    return Colors.lightBlue; // MaterialColor
  } else if (condition.toLowerCase() == 'cloudy') {
    return Colors.grey; // MaterialColor
  } else if (condition.toLowerCase() == 'overcast') {
    return Colors.blueGrey; // MaterialColor
  } else if (condition.toLowerCase() == 'mist') {
    return Colors.cyan; // MaterialColor
  } else if (condition.toLowerCase().contains('rain')) {
    return Colors.blue; // MaterialColor
  } else if (condition.toLowerCase().contains('snow')) {
    return Colors.indigo; // MaterialColor
  } else if (condition.toLowerCase().contains('sleet')) {
    return Colors.lightBlue; // MaterialColor
  } else if (condition.toLowerCase().contains('fog')) {
    return Colors.deepPurple; // MaterialColor
  } else if (condition.toLowerCase().contains('thunder')) {
    return Colors.deepOrange; // MaterialColor
  } else {
    // Default color if condition doesn't match any case
    return Colors.blueGrey; // MaterialColor
  }
}
