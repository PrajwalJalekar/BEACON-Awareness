import 'package:http/http.dart' as http;
import 'dart:convert';

class APIServices {
  static const String apiKey = '66bcdd7b979ef3c60bd3b36991fcebb0';
  static const String baseUrl = 'http://api.openweathermap.org/data/2.5';

  Future<Map<String, dynamic>> fetchData(String path, String city) async {
    final url = '$baseUrl/$path?q=$city&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
