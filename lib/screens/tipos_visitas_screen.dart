import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TiposVisitasScreen extends StatefulWidget {
  @override
  _TiposVisitasScreenState createState() => _TiposVisitasScreenState();
}

class _TiposVisitasScreenState extends State<TiposVisitasScreen> {
  List<dynamic> _tiposVisitas = [];

  @override
  void initState() {
    super.initState();
    _fetchTiposVisitas();
  }

  void _fetchTiposVisitas() async {
    final url = Uri.parse('https://adamix.net/minerd/def/tipos_visitas.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        _tiposVisitas = json.decode(response.body);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar tipos de visitas')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipos de Visitas'),
      ),
      body: ListView.builder(
        itemCount: _tiposVisitas.length,
        itemBuilder: (context, index) {
          final tipoVisita = _tiposVisitas[index];
          return ListTile(
            title: Text(tipoVisita['nombre']),
            subtitle: Text(tipoVisita['descripcion']),
            onTap: () {
              _showDetalleTipoVisita(context, tipoVisita);
            },
          );
        },
      ),
    );
  }

  void _showDetalleTipoVisita(BuildContext context, dynamic tipoVisita) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(tipoVisita['nombre']),
          content: Text(tipoVisita['descripcion']),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
