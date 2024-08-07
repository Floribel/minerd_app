import 'dart:convert';

class Incidencia {
  int? id;
  String titulo;
  String centroEducativo;
  String regional;
  String distrito;
  String fecha;
  String descripcion;
  String? fotoPath;
  String? audioPath;

  Incidencia({
    this.id,
    required this.titulo,
    required this.centroEducativo,
    required this.regional,
    required this.distrito,
    required this.fecha,
    required this.descripcion,
    this.fotoPath,
    this.audioPath,
  });

  // Convierte el modelo a un Map para la base de datos
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'centroEducativo': centroEducativo,
      'regional': regional,
      'distrito': distrito,
      'fecha': fecha,
      'descripcion': descripcion,
      'fotoPath': fotoPath,
      'audioPath': audioPath,
    };
  }

  // Convierte un Map en un objeto Incidencia
  factory Incidencia.fromMap(Map<String, dynamic> map) {
    return Incidencia(
      id: map['id'],
      titulo: map['titulo'],
      centroEducativo: map['centroEducativo'],
      regional: map['regional'],
      distrito: map['distrito'],
      fecha: map['fecha'],
      descripcion: map['descripcion'],
      fotoPath: map['fotoPath'],
      audioPath: map['audioPath'],
    );
  }

  // Método para convertir el objeto en un JSON
  String toJson() => json.encode(toMap());

  // Método para crear un objeto desde un JSON
  factory Incidencia.fromJson(String source) =>
      Incidencia.fromMap(json.decode(source));
}
