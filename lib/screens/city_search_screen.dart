import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String typed_CityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value){
                    typed_CityName=value;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    icon: Icon(Icons.location_city_outlined),
                    hintText:'Enter City name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5),),
                      borderSide: BorderSide.none,
                    )
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, typed_CityName);
                },
                child: Text(
                  'Get Weather in Above City',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
