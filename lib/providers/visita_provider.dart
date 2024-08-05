import 'package:flutter/material.dart';
import '../models/visita_model.dart';
import '../services/db_helper.dart';

class VisitaProvider with ChangeNotifier {
  List<Visita> _visitas = [];
  final DBHelper _dbHelper = DBHelper();

  List<Visita> get visitas => _visitas;

  // Método para obtener visitas desde la base de datos
  Future<void> fetchVisitas() async {
    _visitas = await _dbHelper.getVisitas();
    notifyListeners();
  }

  // Método para agregar una nueva visita
  Future<void> addVisita(Visita visita) async {
    await _dbHelper.insertVisita(visita);
    await fetchVisitas(); // Actualizar la lista después de agregar
  }

  // Método para eliminar todas las visitas
  Future<void> deleteAllVisitas() async {
    await _dbHelper.deleteAllVisitas();
    _visitas = [];
    notifyListeners();
  }
}
