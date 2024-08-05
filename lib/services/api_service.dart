import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<List<dynamic>> fetchNoticias() async {
    final response = await http.get(
        Uri.parse('https://remolacha.net/wp-json/wp/v2/posts?search=minerd'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load noticias');
    }
  }

  Future<dynamic> fetchClima(double latitud, double longitud) async {
    final apiKey = 'your_api_key_here'; // Reemplaza con tu clave de API
    final response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$latitud,$longitud'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load clima');
    }
  }
}
