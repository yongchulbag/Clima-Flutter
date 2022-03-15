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

  @override
  void initState() {
    super.initState();
    getLocationAndData();
  }

  void getLocationAndData() async {
    Location user_location = Location();
    await user_location.getCurrentLocation();

    NetworkGetData networkGetData = NetworkGetData(
        'https://api.openweathermap.org/data/2.5/onecall?lat=37&lon=127&exclude=hourly,daily&appid=$apiKey&units=metric'); // 37 127을 고칠것 ${user_location.latitude} ${user_location.longitude}로

    var received_weatherData = await networkGetData.get();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
    return LocationScreen(locationWeather: received_weatherData,);
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
