import 'package:flutter/material.dart';
import 'package:flutter_weather_api/currentWather.dart';
import 'package:flutter_weather_api/models/location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // List<Location> location = new Location[
  //     city: "hanoi",
  //     country: "vietnam",
  //     lattitude: "21.028511",
  //     longitude: "105.804817"] as List<Location>;

  List<Location> locations = [
    // new Location(
    //     city: "Ho Chi Minh",
    //     country: "vietnam",
    //     lattitude: "10.762622",
    //     longitude: "106.660172"),
    new Location(
      city: "Ha Noi",
      country: "Viet Nam",
      lattitude: "21.028511",
      longitude: "105.804817",
    )
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CurrentWeatherPage(locations: locations, context: context),
    );
  }
}
