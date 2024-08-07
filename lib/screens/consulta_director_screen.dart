import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConsultaDirectorScreen extends StatefulWidget {
  @override
  _ConsultaDirectorScreenState createState() => _ConsultaDirectorScreenState();
}

class _ConsultaDirectorScreenState extends State<ConsultaDirectorScreen> {
  final TextEditingController _cedulaController = TextEditingController();
  Map<String, dynamic>? _directorData;

  void _consultarDirector() async {
    final cedula = _cedulaController.text;
    if (cedula.isNotEmpty) {
      final url = Uri.parse(
          'https://adamix.net/minerd/def/consulta_director.php?cedula=$cedula');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          _directorData = json.decode(response.body);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al consultar el director')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor ingrese una cédula válida')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta de Director'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cedulaController,
              decoration: InputDecoration(labelText: 'Cédula del Director'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _consultarDirector,
              child: Text('Consultar'),
            ),
            SizedBox(height: 20),
            _directorData != null
                ? Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          title: Text('Nombre'),
                          subtitle: Text(_directorData!['nombre'] ?? 'N/A'),
                        ),
                        ListTile(
                          title: Text('Apellido'),
                          subtitle: Text(_directorData!['apellido'] ?? 'N/A'),
                        ),
                        ListTile(
                          title: Text('Fecha de Nacimiento'),
                          subtitle:
                              Text(_directorData!['fecha_nacimiento'] ?? 'N/A'),
                        ),
                        ListTile(
                          title: Text('Dirección'),
                          subtitle: Text(_directorData!['direccion'] ?? 'N/A'),
                        ),
                        ListTile(
                          title: Text('Teléfono'),
                          subtitle: Text(_directorData!['telefono'] ?? 'N/A'),
                        ),
                      ],
                    ),
                  )
                : Text('Ingrese una cédula y presione "Consultar"'),
          ],
        ),
      ),
    );
  }
}
