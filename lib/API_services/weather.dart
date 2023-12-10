import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherApi {
  Future<void> getWeatherData({
    required latitude,
    required longitude,
  }) async {
    final apiKey = '4ddbbd7b406d494ba23235948230912';
    final apiUrl =
        'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=${latitude},${longitude}';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      String cityName = data['location']['name'];
      double temperatureCelsius = data['current']['temp_c'];
      String conditionText = data['current']['condition']['text'];
      String iconUrl = 'https:${data['current']['condition']['icon']}';
      double windSpeedKph = data['current']['wind_kph'];
      int windDegree = data['current']['wind_degree'];
      String windDirection = data['current']['wind_dir'];

      print(response.body);
    } else {
      // Handle errors
      print('Failed to load weather data: ${response.statusCode}');
    }
  }
}
