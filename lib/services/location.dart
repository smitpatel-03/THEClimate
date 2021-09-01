import 'package:geolocator/geolocator.dart';

class Location{
double latitude;
double lungitude;

Future<void> getcurrentLocation() async{
  try{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    lungitude = position.longitude;
  }
  catch(e){
    print(e);
  }



}




}