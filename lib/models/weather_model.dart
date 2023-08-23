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
   if(weatherstatenam=='Clear')
  {
  return 'assets/image/clear (1).png';
  }
   else if(weatherstatenam=='Sunny')
    {
      return 'assets/image/sun.png';
    }

    else if(weatherstatenam=='Partly Cloudy')
    {
      return 'assets/image/cloudy (1).png';
    }
    // else if(weatherstatenam=='Moderate rain')
    // {
    //   return 'assets/image/rain.png';
    // }
    // else if(weatherstatenam=='Patchy rain possible')
    // {
    //   return 'assets/image/rain.png';
    // }
   return 'assets/image/rain.png';
  }
  // MaterialColor getThemeColor()
  // {
  //   if(weatherState=='Sunny')
  //   {
  //     return Colors.orange;
  //   }
  //   else if(weatherState=='Clear')
  //   {
  //     return Colors.cyan;
  //   }
  //   else if(weatherState=='Partly Cloudy')
  //   {
  //     return Colors.blueGrey;
  //   }
  //   else if(weatherState=='Moderate rain')
  //   {
  //     return Colors.indigo;
  //   }
  //   else if(weatherState=='Patchy rain possible')
  //   {
  //     return Colors.blue;
  //   }
  //   return Colors.grey;
  // }

}
