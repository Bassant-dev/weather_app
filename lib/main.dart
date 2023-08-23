import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/views/home_views.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context){
        return WeatherProvider();
      },
      child: MaterialApp(

          debugShowCheckedModeBanner: false,
        home: HomeView()
      ),
    );
  }
}

