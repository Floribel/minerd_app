import 'dart:convert';

class Tecnico {
  int? id;
  String nombre;
  String apellido;
  String matricula;
  String reflexion;
  String username;
  String password;
  String fotoPath;

  Tecnico({
    this.id,
    required this.nombre,
    required this.apellido,
    required this.matricula,
    required this.reflexion,
    required this.username,
    required this.password,
    required this.fotoPath,
  });

  // Convierte el modelo a un Map para la base de datos
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'apellido': apellido,
      'matricula': matricula,
      'reflexion': reflexion,
      'username': username,
      'password': password,
      'fotoPath': fotoPath,
    };
  }

  // Convierte un Map en un objeto Tecnico
  factory Tecnico.fromMap(Map<String, dynamic> map) {
    return Tecnico(
      id: map['id'],
      nombre: map['nombre'],
      apellido: map['apellido'],
      matricula: map['matricula'],
      reflexion: map['reflexion'],
      username: map['username'],
      password: map['password'],
      fotoPath: map['fotoPath'],
    );
  }

  // Método para convertir el objeto en un JSON
  String toJson() => json.encode(toMap());

  // Método para crear un objeto desde un JSON
  factory Tecnico.fromJson(String source) =>
      Tecnico.fromMap(json.decode(source));
}
