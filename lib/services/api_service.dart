import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://adamix.net/minerd/def/';

  Future<Map<String, dynamic>> getData(String endpoint) async {
    final url = Uri.parse(baseUrl + endpoint);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al obtener los datos');
    }
  }

  Future<Map<String, dynamic>> postData(
      String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse(baseUrl + endpoint);
    final response = await http.post(url, body: data);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al enviar los datos');
    }
  }

  Future<void> deleteData(String endpoint) async {
    final url = Uri.parse(baseUrl + endpoint);
    final response = await http.post(url);

    if (response.statusCode != 200) {
      throw Exception('Error al borrar los datos');
    }
  }
}
