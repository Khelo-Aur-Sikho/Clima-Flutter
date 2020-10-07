import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // setting the lat & lon value to state vairables
  double latitude;
  double longitude;

  // setting temp, condition & city for global use
  double temperature;
  int condition;
  String cityName;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();

    var weatherData = await weatherModel.getLocationWeather(); 
    // also could shorten like below aby initializng  the WeatherModel in line just once...
    // var weatherData = WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        )),
      ),
    );
  }
}
