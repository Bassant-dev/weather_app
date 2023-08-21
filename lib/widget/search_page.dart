import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/wearher_sevices.dart';

class SearchPage extends StatelessWidget {

String? CityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),

      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
onSubmitted:(data)async{
CityName=data;
WeatherServices services=WeatherServices();
WeatherModel weather2=await services.getWeather(cityName: CityName!);
print(weather2);
},
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 35,horizontal: 16),
              label: Text('search'),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: 'Enter City'
            ),
          ),
        ),
      ),
    );
  }
}
