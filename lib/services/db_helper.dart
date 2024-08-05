import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/incidencia_model.dart';
import '../models/visita_model.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  static Database? _database;

  factory DBHelper() {
    return _instance;
  }

  DBHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'minerd_app.db');
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE incidencias(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT,
        centroEducativo TEXT,
        regional TEXT,
        distrito TEXT,
        fecha TEXT,
        descripcion TEXT,
        fotoPath TEXT,
        audioPath TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE visitas(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        cedulaDirector TEXT,
        codigoCentro TEXT,
        motivo TEXT,
        fotoEvidenciaPath TEXT,
        comentario TEXT,
        notaVozPath TEXT,
        latitud REAL,
        longitud REAL,
        fecha TEXT,
        hora TEXT
      )
    ''');
  }

  // Métodos para incidencias
  Future<List<Incidencia>> getIncidencias() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('incidencias');
    return List.generate(maps.length, (i) {
      return Incidencia.fromMap(maps[i]);
    });
  }

  Future<int> insertIncidencia(Incidencia incidencia) async {
    final db = await database;
    return await db.insert('incidencias', incidencia.toMap());
  }

  Future<void> deleteAllIncidencias() async {
    final db = await database;
    await db.delete('incidencias');
  }

  // Métodos para visitas
  Future<List<Visita>> getVisitas() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('visitas');
    return List.generate(maps.length, (i) {
      return Visita.fromMap(maps[i]);
    });
  }

  Future<int> insertVisita(Visita visita) async {
    final db = await database;
    return await db.insert('visitas', visita.toMap());
  }

  Future<void> deleteAllVisitas() async {
    final db = await database;
    await db.delete('visitas');
  }
}
