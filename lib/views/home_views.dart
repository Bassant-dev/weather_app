import 'package:flutter/material.dart';
import 'package:weather_app/widget/search_page.dart';

import '../widget/no_veather_body.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return SearchPage();
            }));
          }, icon:Icon(Icons.search))
        ],
        title: const Text('Weather App'),
      ),
      body: const NoWeatherBody(),
    );
  }
}