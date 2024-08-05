class Visita {
  final int id;
  final String cedulaDirector;
  final String codigoCentro;
  final String motivo;
  final String fotoEvidenciaPath;
  final String comentario;
  final String notaVozPath;
  final double latitud;
  final double longitud;
  final DateTime fecha;
  final String hora;

  Visita({
    required this.id,
    required this.cedulaDirector,
    required this.codigoCentro,
    required this.motivo,
    required this.fotoEvidenciaPath,
    required this.comentario,
    required this.notaVozPath,
    required this.latitud,
    required this.longitud,
    required this.fecha,
    required this.hora,
  });

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
      'fecha': fecha.toIso8601String(),
      'hora': hora,
    };
  }

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
      fecha: DateTime.parse(map['fecha']),
      hora: map['hora'],
    );
  }
}
