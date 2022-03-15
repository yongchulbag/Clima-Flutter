import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
     Location user_location = Location();
     await user_location.getCurrentLocation();

     print(user_location.latitude);
     print(user_location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
