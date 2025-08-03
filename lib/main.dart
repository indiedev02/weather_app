import 'package:flutter/material.dart';
import 'package:weather_application/data/notifiers.dart';
import 'package:weather_application/screens/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.black,
              brightness: isDarkMode ? Brightness.dark : Brightness.light,
            ),
          ),
          home: WeatherPage(),
        );
      },
    );
  }
}
