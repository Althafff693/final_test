import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApi {
  static const String apiKey = 'YOUR_API_KEY';
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  static Future<Map<String, dynamic>> fetchWeather(String city) async {
    final url = '$baseUrl?q=$city&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Gagal mengambil data cuaca');
    }
  }
}
