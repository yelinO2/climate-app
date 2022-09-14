import 'package:flutter/material.dart';
import 'package:weather/services/api.dart';

import '../models/weather.dart';

// ignore: must_be_immutable
class WeatherBox extends StatefulWidget {
  const WeatherBox({Key? key}) : super(key: key);

  @override
  State<WeatherBox> createState() => _WeatherBoxState();
}

class _WeatherBoxState extends State<WeatherBox> {
  dynamic city = 'mandalay';

  Weather? weather;

  Future getCurrentWeather() async {
    API().getWeather('$city').then((value) {
      setState(() {
        weather = value;
      });

      debugPrint(weather!.main!.feelsLike.toString());
    });
  }

  @override
  void initState() {
    getCurrentWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text('${weather!.main!.temp!}')],
    );
  }
}
