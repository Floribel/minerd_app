import 'package:flutter/material.dart';
import '../models/visita_model.dart';
import '../services/db_helper.dart'; // Asegúrate de tener esta referencia

class VisitaProvider with ChangeNotifier {
  List<Visita> _visitas = [];
  DBHelper _dbHelper = DBHelper();

  List<Visita> get visitas => _visitas;

  Future<void> loadVisitas() async {
    _visitas = await _dbHelper.getVisitas();
    notifyListeners();
  }

  Future<void> insertarVisita(Visita visita) async {
    await _dbHelper.insertVisita(visita);
    _visitas.add(visita);
    notifyListeners();
  }

  Future<void> deleteAllVisitas() async {
    await _dbHelper.deleteAllVisitas();
    _visitas.clear();
    notifyListeners();
  }
}
