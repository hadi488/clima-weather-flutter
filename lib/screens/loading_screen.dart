import 'package:clima_weather_flutter/services/location.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('Latitude: ${location.latitude}\n Longitude: ${location.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
