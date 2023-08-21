import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
class WeatherServices
{
  String baseUrl='http://api.weatherapi.com/v1';
  String apiKey='686dde618071424096c94102232904';
  Future<WeatherModel> getWeather({required String cityName})async
  {

Uri url=Uri.parse(
    '$baseUrl/current.json?key=$apiKey&q=$cityName'
);
http.Response response = await http.get(url);
Map<String,dynamic> data=jsonDecode(response.body);
WeatherModel weather=WeatherModel.fromJson(data);
return weather;

  }
}