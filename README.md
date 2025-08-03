# 🌤️ Flutter Weather App

A simple Flutter weather application that fetches and displays the current temperature and city name using a weather API.

## 🚀 Features

- Auto-detects the user's current city.
- Fetches real-time weather data.
- Displays city name and current temperature.

## 📁 Project Structure

```
lib/
├── main.dart
└── screens/
    └── weather_page.dart
```

## 🔧 Setup Instructions

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-username/flutter-weather-app.git
   cd flutter-weather-app
   ```

2. **Get dependencies**:

   ```bash
   flutter pub get
   ```

3. **Add your Weather API key**:

   - Open the file: `lib/screens/weather_page.dart`
   - Replace the API key in the following line with your own from [OpenWeatherMap](https://openweathermap.org/api):

     ```dart
     final _weatherService = WeatherService("YOUR_API_KEY_HERE");
     ```

4. **Run the app**:

   ```bash
   flutter run
   ```

## 🔑 Getting an API Key

- Sign up at [https://openweathermap.org/](https://openweathermap.org/)
- Go to the API keys section and generate a key.
- Paste that key into the `weatherService` constructor in `lib/screens/weather_page.dart`.
