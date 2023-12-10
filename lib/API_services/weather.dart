import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherApi {
  
    static Future<Map<String, dynamic>> getWeatherData({
    required latitude,
    required longitude,
  }) async {
    final apiKey = '4ddbbd7b406d494ba23235948230912';
    try {
      final response = await http.get(
        Uri.parse('https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$latitude,$longitude'),
      );

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load weather data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
