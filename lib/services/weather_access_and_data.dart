import 'package:clima/services/location_get.dart';
import 'package:clima/services/network_get_data.dart';


const apiKey = 'cadf49837ccb3c2815996601f83586f9';

class WeatherModelAndData {

  Future<dynamic> getWeaterFromCity(String received_CityName) async{
     var cityname_url='api.openweathermap.org/data/2.5/weather?q=$received_CityName&appid=$apiKey&units=metric';
     NetworkGetData networkGetData = await NetworkGetData(cityname_url);
     var city_WeatherDate=networkGetData.get();
     return city_WeatherDate;
  }

  Future<dynamic> getLocationAndDataInside() async {
    Location user_location = Location();
    await user_location.getCurrentLocation();

    NetworkGetData networkGetData = NetworkGetData(
        'https://api.openweathermap.org/data/2.5/onecall?lat=37&lon=127&exclude=hourly,daily&appid=$apiKey&units=metric'); // 37 127을 고칠것 ${user_location.latitude} ${user_location.longitude}로

    var received_weatherData = await networkGetData.get();

    return received_weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
