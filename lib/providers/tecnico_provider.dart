import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/tecnico_model.dart';

class TecnicoProvider with ChangeNotifier {
  Tecnico? _loggedInTecnico;

  Tecnico? get loggedInTecnico => _loggedInTecnico;

  Future<bool> registerTecnico(Tecnico tecnico) async {
    final url = Uri.parse('https://adamix.net/minerd/def/registro.php');
    final response = await http.post(url, body: tecnico.toMap());

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['exito'] == true) {
        _loggedInTecnico = tecnico;
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> loginTecnico(String cedula, String clave) async {
    final url = Uri.parse('https://adamix.net/minerd/def/iniciar_sesion.php');
    final response = await http.post(url, body: {
      'cedula': cedula,
      'clave': clave,
    });

    print('Respuesta de la API: ${response.body}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['exito'] == true) {
        _loggedInTecnico = Tecnico.fromMap(data['datos']);
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  void logout() {
    _loggedInTecnico = null;
    notifyListeners();
  }
}
