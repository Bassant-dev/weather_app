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
@override
  String toString() {

    return 'temp=$temp mintemp=$mintemp ';
  }
}
