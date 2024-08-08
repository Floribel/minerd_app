import 'package:flutter/material.dart';
import '../models/incidencia_model.dart';
import '../services/db_helper.dart'; // Asegúrate de tener esta referencia

class IncidenciaProvider with ChangeNotifier {
  List<Incidencia> _incidencias = [];
  DBHelper _dbHelper = DBHelper();

  List<Incidencia> get incidencias => _incidencias;

  Future<void> loadIncidencias() async {
    _incidencias = await _dbHelper.getIncidencias();
    notifyListeners();
  }

  Future<void> insertarIncidencia(Incidencia incidencia) async {
    await _dbHelper.insertIncidencia(incidencia);
    _incidencias.add(incidencia);
    notifyListeners();
  }

  Future<void> deleteAllIncidencias() async {
    await _dbHelper.deleteAllIncidencias();
    _incidencias.clear();
    notifyListeners();
  }
}
