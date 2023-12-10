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
      // Parse and handle the weather data here
      print(response.body);
    } else {
      // Handle errors
      print('Failed to load weather data: ${response.statusCode}');
    }
  }
}
