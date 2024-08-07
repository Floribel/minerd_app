import 'dart:convert';

class Visita {
  int? id;
  String cedulaDirector;
  String codigoCentro;
  String motivo;
  String? fotoEvidenciaPath;
  String comentario;
  String? notaVozPath;
  double latitud;
  double longitud;
  String fecha;
  String hora;

  Visita({
    this.id,
    required this.cedulaDirector,
    required this.codigoCentro,
    required this.motivo,
    this.fotoEvidenciaPath,
    required this.comentario,
    this.notaVozPath,
    required this.latitud,
    required this.longitud,
    required this.fecha,
    required this.hora,
  });

  // Convierte el modelo a un Map para la base de datos
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cedulaDirector': cedulaDirector,
      'codigoCentro': codigoCentro,
      'motivo': motivo,
      'fotoEvidenciaPath': fotoEvidenciaPath,
      'comentario': comentario,
      'notaVozPath': notaVozPath,
      'latitud': latitud,
      'longitud': longitud,
      'fecha': fecha,
      'hora': hora,
    };
  }

  // Convierte un Map en un objeto Visita
  factory Visita.fromMap(Map<String, dynamic> map) {
    return Visita(
      id: map['id'],
      cedulaDirector: map['cedulaDirector'],
      codigoCentro: map['codigoCentro'],
      motivo: map['motivo'],
      fotoEvidenciaPath: map['fotoEvidenciaPath'],
      comentario: map['comentario'],
      notaVozPath: map['notaVozPath'],
      latitud: map['latitud'],
      longitud: map['longitud'],
      fecha: map['fecha'],
      hora: map['hora'],
    );
  }

  // Método para convertir el objeto en un JSON
  String toJson() => json.encode(toMap());

  // Método para crear un objeto desde un JSON
  factory Visita.fromJson(String source) => Visita.fromMap(json.decode(source));
}
