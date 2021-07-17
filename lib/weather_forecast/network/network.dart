import 'dart:convert';

import 'package:first_flutter_app/util/utils.dart';
import 'package:first_flutter_app/weather_forecast/model/weather_forecast_model.dart';
import 'package:http/http.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecast({String cityName}) async {
    var finalUrl = 'http://api.openweathermap.org/data/2.5/weather?q=' +
        cityName +
        '&APPID=' +
        ForecastUtil.appId +
        '&units=metric';
    var response = await get(Uri.encodeFull(finalUrl));
    print("Url : ${Uri.encodeFull(finalUrl)}");
    if (response.statusCode == 200) {
      return WeatherForecastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting weather forecasts");
    }
  }
}
