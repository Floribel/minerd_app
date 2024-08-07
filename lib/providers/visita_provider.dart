import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/visita_model.dart';

class VisitaProvider with ChangeNotifier {
  List<Visita> _visitas = [];

  List<Visita> get visitas => _visitas;

  Future<void> loadVisitas() async {
    final url = Uri.parse('https://adamix.net/minerd/def/mis_visitas.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _visitas = data.map((item) => Visita.fromMap(item)).toList();
      notifyListeners();
    } else {
      throw Exception('Error al cargar las visitas');
    }
  }

  Future<void> insertarVisita(Visita visita) async {
    final url = Uri.parse('https://adamix.net/minerd/def/registrar_visita.php');
    final response = await http.post(url, body: visita.toMap());

    if (response.statusCode == 200) {
      _visitas.add(visita);
      notifyListeners();
    } else {
      throw Exception('Error al registrar la visita');
    }
  }

  Future<void> deleteAllVisitas() async {
    final url = Uri.parse('https://adamix.net/minerd/def/borrar_visitas.php');
    final response = await http.post(url);

    if (response.statusCode == 200) {
      _visitas.clear();
      notifyListeners();
    } else {
      throw Exception('Error al borrar las visitas');
    }
  }
}
