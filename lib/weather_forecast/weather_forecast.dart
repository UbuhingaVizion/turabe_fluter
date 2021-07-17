import 'package:first_flutter_app/weather_forecast/model/weather_forecast_model.dart';
import 'package:flutter/material.dart';

import 'package:first_flutter_app/weather_forecast/network/network.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key key}) : super(key: key);

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  Future<WeatherForecastModel> forecastObject;
  String _cityName = "Bujumbura";
  @override
  void initState() {
    forecastObject = Network().getWeatherForecast(cityName: _cityName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forecast"),
        centerTitle: true,
      ),
    );
  }
}
