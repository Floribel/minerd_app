import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/incidencia_model.dart';

class IncidenciaProvider with ChangeNotifier {
  List<Incidencia> _incidencias = [];

  List<Incidencia> get incidencias => _incidencias;

  Future<void> loadIncidencias() async {
    final url = Uri.parse('https://adamix.net/minerd/def/situaciones.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _incidencias = data.map((item) => Incidencia.fromMap(item)).toList();
      notifyListeners();
    } else {
      throw Exception('Error al cargar las incidencias');
    }
  }

  Future<void> insertarIncidencia(Incidencia incidencia) async {
    final url = Uri.parse('https://adamix.net/minerd/def/registrar_visita.php');
    final response = await http.post(url, body: incidencia.toMap());

    if (response.statusCode == 200) {
      _incidencias.add(incidencia);
      notifyListeners();
    } else {
      throw Exception('Error al registrar la incidencia');
    }
  }

  Future<void> deleteAllIncidencias() async {
    final url =
        Uri.parse('https://adamix.net/minerd/def/borrar_incidencias.php');
    final response = await http.post(url);

    if (response.statusCode == 200) {
      _incidencias.clear();
      notifyListeners();
    } else {
      throw Exception('Error al borrar las incidencias');
    }
  }
}
