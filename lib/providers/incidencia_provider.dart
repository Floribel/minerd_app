import 'package:flutter/material.dart';
import '../models/incidencia_model.dart';
import '../services/db_helper.dart';

class IncidenciaProvider with ChangeNotifier {
  List<Incidencia> _incidencias = [];
  final DBHelper _dbHelper = DBHelper();

  List<Incidencia> get incidencias => _incidencias;

  // Método para obtener incidencias desde la base de datos
  Future<void> fetchIncidencias() async {
    _incidencias = await _dbHelper.getIncidencias();
    notifyListeners();
  }

  // Método para agregar una nueva incidencia
  Future<void> addIncidencia(Incidencia incidencia) async {
    await _dbHelper.insertIncidencia(incidencia);
    await fetchIncidencias(); // Actualizar la lista después de agregar
  }

  // Método para eliminar todas las incidencias
  Future<void> deleteAllIncidencias() async {
    await _dbHelper.deleteAllIncidencias();
    _incidencias = [];
    notifyListeners();
  }
}
