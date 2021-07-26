import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_weather_api/models/weather.dart';
import 'package:http/http.dart' as http;

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);

  @override
  _CurrentWeatherPageState createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            // ignore: unnecessary_null_comparison
            if (snapshot != null) {
              Weather? _weather = snapshot.data as Weather?;
              if (_weather == null) {
                return Text("Error getting weather");
              } else {
                return weatherBox(_weather);
              }
            } else {
              return CircularProgressIndicator();
            }
          },
          future: getCurrentWeather(),
        ),
      ),
    );
  }

  Widget weatherBox(Weather _weather) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              "${_weather.temp}°C",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55),
            ),
          ),
          Container(
              margin: EdgeInsets.all(10),
              child: Text("${_weather.description}")),
          Container(
              margin: EdgeInsets.all(10),
              child: Text("Feels:${_weather.feelsLike}°C")),
          Container(
              margin: EdgeInsets.all(10),
              child: Text("H:${_weather.high}°C L:${_weather.low}°C")),
        ],
      ),
    );
  }

  Future getCurrentWeather() async {
    Weather? weather;
    //YOUR CITY
    String city = "hanoi";
    //YOUT API KEY
    String apiKey = "569261f1114cd27b116aecc86d52f879";

    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      weather = Weather.fromJson(jsonDecode(response.body));
    } else {}
    return weather;
  }
}
