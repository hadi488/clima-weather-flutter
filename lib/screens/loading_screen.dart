import 'dart:convert';
import 'dart:io';

import 'package:clima_weather_flutter/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    sleep(Duration(seconds: 2));
    getLocationData();
    getData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('Latitude: ${location.latitude}\n Longitude: ${location.longitude}');
  }

  void getData() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          'https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m',
        ),
      );
      if (response.statusCode == 200) {
        String data = response.body;
        var longitde = jsonDecode(data)['longitude'];
        var currentTempUnit = jsonDecode(
          data,
        )['current_units']['temperature_2m'];
        double currentTempValue = jsonDecode(data)['current']['temperature_2m'];
        print(longitde);
        var time = jsonDecode(data)['hourly']['time'][0];
        print('${currentTempValue.toString()} $currentTempUnit');
        print(time);
      } else {
        print('Failed to get data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
