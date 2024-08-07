import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/tecnico_model.dart';

class TecnicoProvider with ChangeNotifier {
  Tecnico? _loggedInTecnico;

  Tecnico? get loggedInTecnico => _loggedInTecnico;

  Future<bool> loginTecnico(String username, String password) async {
    final url = Uri.parse('https://adamix.net/minerd/def/iniciar_sesion.php');
    final response = await http.post(url, body: {
      'username': username,
      'password': password,
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['success'] == true) {
        // Asegúrate de que la respuesta de la API tenga un campo que indique éxito
        _loggedInTecnico = Tecnico.fromMap(data['data']);
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> registerTecnico(Tecnico tecnico) async {
    final url = Uri.parse('https://adamix.net/minerd/def/registro.php');
    final response = await http.post(url, body: tecnico.toMap());

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['success'] == true) {
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

  void logout() {
    _loggedInTecnico = null;
    notifyListeners();
  }
}
