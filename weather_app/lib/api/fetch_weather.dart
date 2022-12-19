import 'dart:convert';

import 'package:weather_app/api/api_key.dart';
import 'package:weather_app/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_data_current.dart';
import 'package:weather_app/model/weather_data_daily.dart';
import 'package:weather_app/model/weather_data_hourly.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

// processing the data from the response from => jSON request;

  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonstring = jsonDecode(response.body);
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonstring),
        WeatherDataHourly.fromJson(jsonstring),
        WeatherDataDaily.fromJson(jsonstring));
    return weatherData!;
  }

  String apiURL(var lat, var lon) {
    String url;
    url =
        "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric&exclude=minutely";
    return url;
  }
}
