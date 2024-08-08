import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/incidencia_model.dart';
import '../models/visita_model.dart';

class DBHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    return await openDatabase(
      inMemoryDatabasePath, // Base de datos en memoria
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE incidencias(id INTEGER PRIMARY KEY, titulo TEXT, centroEducativo TEXT, regional TEXT, distrito TEXT, fecha TEXT, descripcion TEXT, fotoPath TEXT, audioPath TEXT)',
        );
        await db.execute(
          'CREATE TABLE visitas(id INTEGER PRIMARY KEY, cedulaDirector TEXT, codigoCentro TEXT, motivo TEXT, fotoEvidenciaPath TEXT, comentario TEXT, notaVozPath TEXT, latitud REAL, longitud REAL, fecha TEXT, hora TEXT)',
        );
      },
    );
  }

  Future<void> insertIncidencia(Incidencia incidencia) async {
    final db = await database;
    await db.insert('incidencias', incidencia.toMap());
  }

  Future<void> insertVisita(Visita visita) async {
    final db = await database;
    await db.insert('visitas', visita.toMap());
  }

  Future<List<Incidencia>> getIncidencias() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('incidencias');
    return List.generate(maps.length, (i) {
      return Incidencia.fromMap(maps[i]);
    });
  }

  Future<List<Visita>> getVisitas() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('visitas');
    return List.generate(maps.length, (i) {
      return Visita.fromMap(maps[i]);
    });
  }

  Future<void> deleteAllIncidencias() async {
    final db = await database;
    await db.delete('incidencias');
  }

  Future<void> deleteAllVisitas() async {
    final db = await database;
    await db.delete('visitas');
  }
}
