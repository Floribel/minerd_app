import 'dart:convert';

class Tecnico {
  String cedula;
  String nombre;
  String apellido;
  String clave;
  String correo;
  String telefono;
  String fechaNacimiento;

  Tecnico({
    required this.cedula,
    required this.nombre,
    required this.apellido,
    required this.clave,
    required this.correo,
    required this.telefono,
    required this.fechaNacimiento,
  });

  // Convierte el modelo a un Map para la base de datos
  Map<String, dynamic> toMap() {
    return {
      'cedula': cedula,
      'nombre': nombre,
      'apellido': apellido,
      'clave': clave,
      'correo': correo,
      'telefono': telefono,
      'fecha_nacimiento': fechaNacimiento,
    };
  }

  // Convierte un Map en un objeto Tecnico
  factory Tecnico.fromMap(Map<String, dynamic> map) {
    return Tecnico(
      cedula: map['cedula'] ?? '',
      nombre: map['nombre'] ?? '',
      apellido: map['apellido'] ?? '',
      clave: map['clave'] ?? '',
      correo: map['correo'] ?? '',
      telefono: map['telefono'] ?? '',
      fechaNacimiento: map['fecha_nacimiento'] ?? '',
    );
  }

  // Método para convertir el objeto en un JSON
  String toJson() => json.encode(toMap());

  // Método para crear un objeto desde un JSON
  factory Tecnico.fromJson(String source) =>
      Tecnico.fromMap(json.decode(source));
}
