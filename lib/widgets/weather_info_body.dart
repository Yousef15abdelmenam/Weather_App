import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            getThemeColour(weatherModel.weatherCondition),
            getThemeColour(weatherModel.weatherCondition)[300]!,
            getThemeColour(weatherModel.weatherCondition)[50]!
          ])),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.cityname,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network("https:${weatherModel.image}"),
                  Text(
                    weatherModel.temp.toString(),
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Text(
                        'maxtemp: ${weatherModel.maxtemp.round()}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'mintemp: ${weatherModel.mintemp.round()}',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                weatherModel.weatherCondition,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
