import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_application/data/notifiers.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService("YOUR_API_KEY");
  Weather? _weather;
  _fetchWeather() async {
    final cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return "assets/sunny.json";
    switch (mainCondition.toLowerCase()) {
      case "clouds":
      case "mist":
      case "smoke":
      case "haze":
      case "dust":
      case "fog":
        return "assets/cloudy.json";
      case "rain":
      case "drizzle":
      case "shower rain":
        return "assets/rainy.json";
      case "thunderstorm":
        return "assets/thunder.json";
      default:
        return "assets/sunny.json";
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
            Text(
              '${_weather?.temperature.round().toString()}°C',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Text(
              _weather?.cityName ?? "Loading City",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            IconButton(
              onPressed: () {
                isDarkModeNotifier.value = !isDarkModeNotifier.value;
              },
              icon: ValueListenableBuilder(
                valueListenable: isDarkModeNotifier,
                builder: (context, isDarkMode, child) {
                  return Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
