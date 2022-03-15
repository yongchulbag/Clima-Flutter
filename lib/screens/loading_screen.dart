import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
    try {
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      print(position);
    }
    catch (exception) {
      print(exception); //exception 또는 e 둘중 하나로 통일해줘야 알아묵음
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
