import 'package:flutter/material.dart';
import 'package:clima/services/location_get.dart';
import 'package:clima/services/network_get_data.dart';
import 'location_weather_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const apiKey = 'cadf49837ccb3c2815996601f83586f9';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationAndData();
  }

  void getLocationAndData() async {
    Location user_location = Location();
    await user_location.getCurrentLocation();

    latitude = user_location.latitude;
    longitude = user_location.longitude;

    NetworkGetData networkGetData = NetworkGetData(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=hourly,daily&appid=$apiKey');

    var received_weatherData = await networkGetData.get();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
    return LocationScreen();
    }));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 150,
        ),
      )
    );
  }
}
