import 'package:flutter/material.dart';

class WeatherModel{
  String date;
  double temp;
  double mintemp;
  double maxtemp;
  String weatherstatenam;

  WeatherModel({required this.date,
    required this.temp,
    required this.mintemp,
    required this.maxtemp,
    required this.weatherstatenam});

factory WeatherModel.fromJson(dynamic data){
 var jsonData=data['forecast']['forecastday'][0]['day'];

 return WeatherModel(
     date: data['location']['localtime'],
     temp: jsonData['avgtemp_c'],
     mintemp:jsonData['mintemp_c'],
     maxtemp:jsonData['maxtemp_c'],
     weatherstatenam: jsonData['condition']['text']);
}
// @override
//   String toString() {
//
//     return 'temp=$temp mintemp=$mintemp ';
//   }
  String getImage()
  {
    if(weatherstatenam=='Sunny')
    {
      return 'assets/image/sun.png';
    }
    else if(weatherstatenam=='Clear')
    {
      return 'assets/image/clear (1).png';
    }
    else if(weatherstatenam=='Partly Cloudy')
    {
      return 'assets/image/cloudy (1).png';
    }
    else if(weatherstatenam=='Moderate rain')
    {
      return 'assets/image/rainy.png';
    }
    else if(weatherstatenam=='Patchy rain possible')
    {
      return 'assets/image/rainy.png';
    }
    return 'assets/images/clear (1).png';
  }
  MaterialColor getThemeColor()
  {
    if(weatherstatenam=='Sunny')
    {
      return Colors.orange;
    }
    else if(weatherstatenam=='Clear')
    {
      return Colors.cyan;
    }
    else if(weatherstatenam=='Partly Cloudy')
    {
      return Colors.blueGrey;
    }
    else if(weatherstatenam=='Moderate rain')
    {
      return Colors.indigo;
    }
    else if(weatherstatenam=='Patchy rain possible')
    {
      return Colors.blue;
    }
    return Colors.grey;
  }

}
