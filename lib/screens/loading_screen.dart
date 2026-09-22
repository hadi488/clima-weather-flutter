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

  Future<void> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );
    print(position);
    print(position.altitude);
    print(position.accuracy);
    print(position.altitudeAccuracy);
    print(position.speed);
    print(position.speedAccuracy);
    print(position.timestamp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
