import 'package:clima_weather_flutter/screens/location_screen.dart';
import 'package:clima_weather_flutter/services/location.dart';
import 'package:clima_weather_flutter/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 9900),
    );
    getLocationData();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    Location location = Location();
    await location.getCurrentLocation();
    var weatherData = await weatherModel.getWeatherData(location);
    navigateToLocationScreen(weatherData);
  }

  void navigateToLocationScreen(dynamic weatherData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(weatherData: weatherData);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitThreeInOut(
          controller: controller,
          size: 50.0,
          // delay: Duration(milliseconds: 600),
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index.isEven ? Colors.blue : Colors.green,
              ),
            );
          },
        ),
      ),
    );
  }
}
