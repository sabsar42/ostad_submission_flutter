import 'package:ostad_submission_flutter/screens/weather_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CrudApp());
}

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: WeatherScreen(),
    );
  }
}
