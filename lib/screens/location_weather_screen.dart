import 'package:clima/screens/city_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather_access_and_data.dart';
import 'package:clima/screens/city_search_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModelAndData weatherModel = WeatherModelAndData();
  double detail_temperature;
  int temperature;
  int condition;
  String cityName;
  String weatherIcon;
  String weatherComment;

  @override
  void initState() {
    super.initState();
    print(widget.locationWeather);

    weatherPassToScreen(widget.locationWeather);
  }

  void weatherPassToScreen(dynamic screen_weather_data) {
    setState(() {
      if (screen_weather_data == null) {
        temperature = 0;
        weatherIcon = 'error T.T';
        weatherComment = 'unable to get appropriate data';
        cityName = 'no where';
        return; // 여기 return을 넣으면 아래 6줄을 안 읽고 그냥 종료한다고 헌다!!! 진짜인가?
      }
      double detail_temperature = screen_weather_data['main']['temp'];
      temperature = detail_temperature.toInt();
      condition = screen_weather_data['cod'];
      cityName = screen_weather_data['name'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      weatherComment = weatherModel.getMessage(temperature);
      print(weatherComment);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var screen_weather_data =
                          await weatherModel.getLocationAndDataInside();
                      weatherPassToScreen(screen_weather_data);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var received_CityName =
                          await Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CityScreen();
                        },
                      ));
                      print(received_CityName);
                      if (received_CityName != null) {
                        var renewed_screen_weather_data = await weatherModel.getWeaterFromCity(received_CityName);
                        print(renewed_screen_weather_data);
                        weatherPassToScreen(renewed_screen_weather_data);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherComment in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
