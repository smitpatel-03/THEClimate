import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = '65afe7195e2deaaa0438b0079b9e4789';
const urlop = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getcityweather(String cityName) async{

    var url = '$urlop?q=$cityName&appid=$apikey&units=metric';
    Networkinghelp networkinghelp = Networkinghelp(url:url);
    var weatherdata = await networkinghelp.getData();
    return weatherdata;

  }

  Future<dynamic> getweatherData() async{
  Location location = Location();
  await location.getcurrentLocation();
  Networkinghelp networkinghelp = Networkinghelp(url: '$urlop?lat=${location.latitude}&lon=${location.lungitude}&appid=$apikey&units=metric');
  
  var weatherdata =  await networkinghelp.getData();
  return weatherdata;

  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
