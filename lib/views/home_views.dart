import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/widget/search_page.dart';

import '../widget/no_veather_body.dart';


class HomeView extends StatelessWidget {
   HomeView({Key? key}) : super(key: key);
   String ?cityName;
  WeatherModel? Data;


  @override
  Widget build(BuildContext context) {
   Data=Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return SearchPage(

              );
            }));
          }, icon:Icon(Icons.search))
        ],
        title: const Text('Weather App'),
      ),
      body:Data==null? const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text(
                'there is no weather 😔 start',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'searching now 🔍',
                style: TextStyle(
                  fontSize: 30,
                ),
              )
            ],
          ),
        ),
      ):Container(

        decoration: BoxDecoration(

            gradient: LinearGradient(
                colors:
            [
             Data!.getThemeColor(),
              Data!.getThemeColor()[300]!,
              Data!.getThemeColor()[100]!,

            ],begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 3,),
              Text(
                  Provider.of<WeatherProvider>(context).cityName!,
                style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
              Text( 'updated at:${Data!.date.toString()}',style: TextStyle(fontSize: 24)),
              const SizedBox(
                height: 32,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: AssetImage(Data!.getImage()),
                    width: 70,
                    height: 70,
                  ),

                  Text(
                   Data!.temp.toInt().toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                   Column(
                    children: [
                      Text(
                        'maxTemp: ${Data!.maxtemp.toInt()}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'minTemp: ${Data!.mintemp.toInt()}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Spacer(),
             Text(
                Data!.weatherstatenam ,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Spacer(flex: 5,)
            ],
          ),
        ),
      ),
    );
  }
}