import 'dart:convert';
import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  final List<Weather> weatherData = [
    Weather(
      city: "New York",
      temperature: 20,
      condition: "Clear",
      humidity: 60,
      windSpeed: 5.5,
    ),
    Weather(
      city: "Los Angeles",
      temperature: 25,
      condition: "Sunny",
      humidity: 50,
      windSpeed: 6.8,
    ),
    Weather(
      city: "London",
      temperature: 15,
      condition: "Partly Cloudy",
      humidity: 70,
      windSpeed: 4.2,
    ),
    Weather(
      city: "Tokyo",
      temperature: 28,
      condition: "Rainy",
      humidity: 75,
      windSpeed: 8.0,
    ),
    Weather(
      city: "Sydney",
      temperature: 22,
      condition: "Cloudy",
      humidity: 55,
      windSpeed: 7.3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Info App'),
        ),
        body: ListView.builder(
          itemCount: weatherData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(12),
              child: Card(
                child: ListTile(
                  title: Text(
                    'City: ${weatherData[index].city}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Temperature: ${weatherData[index].temperature}°C',
                          style: siz16()),
                      Text('Condition: ${weatherData[index].condition}',
                          style: siz16()),
                      Text('Humidity: ${weatherData[index].humidity}%',
                          style: siz16()),
                      Text('Wind Speed: ${weatherData[index].windSpeed} m/s',
                          style: siz16()),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Weather {
  final String city;
  final double temperature;
  final String condition;
  final int humidity;
  final double windSpeed;

  Weather({
    required this.city,
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
  });
}

TextStyle siz16() {
  return const TextStyle(
    fontSize: 16,
  );
}
