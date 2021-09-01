import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import './location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

void initState(){
  super.initState();
  getLocation();
}
void getLocation() async{

  var weatherdata = await WeatherModel().getweatherData();

  Navigator.push(context, MaterialPageRoute(builder: (context){
    return LocationScreen(locationWeather: weatherdata,);
  }));
  
}

  @override
  
  Widget build(BuildContext context) {

    return Scaffold(
      body: SpinKitCircle(
        color: Colors.white,
        size: 100.0,
        duration: Duration(milliseconds: 4800),
      ),
    );
  }
}