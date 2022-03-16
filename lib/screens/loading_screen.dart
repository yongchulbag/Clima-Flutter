import 'package:flutter/material.dart';
import 'location_weather_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather_access_and_data.dart';



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

    var received_weatherData = await WeatherModelAndData().getLocationAndDataInside(); // 웨더모델 초기화와 동시에 데이타 반환

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
