import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';


class WeatherScreen extends StatelessWidget {
  final List<Map<String, dynamic>> jsonString = [
    {
      "city": "New York",
      "temperature": 20,
      "condition": "Clear",
      "humidity": 60,
      "windSpeed": 5.5
    },
    {
      "city": "Los Angeles",
      "temperature": 25,
      "condition": "Sunny",
      "humidity": 50,
      "windSpeed": 6.8
    },
    {
      "city": "London",
      "temperature": 15,
      "condition": "Partly Cloudy",
      "humidity": 70,
      "windSpeed": 4.2
    },
    {
      "city": "Tokyo",
      "temperature": 28,
      "condition": "Rainy",
      "humidity": 75,
      "windSpeed": 8.0
    },
    {
      "city": "Sydney",
      "temperature": 22,
      "condition": "Cloudy",
      "humidity": 55,
      "windSpeed": 7.3
    }
  ];

  List<Weather> weatherList = [];

  WeatherScreen() {
    for (var weatherData in jsonString) {
      weatherList.add(
        Weather(
          city: weatherData["city"],
          temperature: weatherData['temperature'],
          condition: weatherData['condition'],
          humidity: weatherData['humidity'],
          windSpeed: weatherData['windSpeed'],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Info App'),
        ),
        body: ListView.builder(
          itemCount: weatherList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(12),
              child: Card(
                child: ListTile(
                  title: Text(
                    'City: ${weatherList[index].city}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Temperature: ${weatherList[index].temperature}°C',
                        style: siz16(),
                      ),
                      Text('Condition: ${weatherList[index].condition}',
                        style: siz16(),
                      ),
                      Text('Humidity: ${weatherList[index].humidity}%',
                        style: siz16(),
                      ),
                      Text('Wind Speed: ${weatherList[index].windSpeed} m/s',
                        style: siz16(),
                      ),
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
  final int temperature;
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
