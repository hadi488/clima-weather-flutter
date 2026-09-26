import 'package:clima_weather_flutter/services/location.dart';
import 'package:clima_weather_flutter/services/networking.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? longitude;
  double? latitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    print(latitude);
    print(longitude);
    getWeatherData();
  }

  void getWeatherData() async {
    NetworkInteractor networkInteractor = NetworkInteractor(
      url:
          'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m',
    );
    var returnedDecodedData = await networkInteractor.getData();
    print(returnedDecodedData);
    print(returnedDecodedData['current_units']['temperature_2m']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
