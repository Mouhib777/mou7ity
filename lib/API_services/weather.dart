import 'package:http/http.dart' as http;

Future<void> getWeatherData({
  required 
}) async {
  final apiKey = 'YOUR_API_KEY';
  final city = 'CITY_NAME';
  final apiUrl = 'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city';

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    // Parse and handle the weather data here
    print(response.body);
  } else {
    // Handle errors
    print('Failed to load weather data: ${response.statusCode}');
  }
}
