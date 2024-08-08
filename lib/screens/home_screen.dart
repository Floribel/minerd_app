import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/incidencia_provider.dart';
import '../providers/visita_provider.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final incidenciaProvider = Provider.of<IncidenciaProvider>(context);
    final visitaProvider = Provider.of<VisitaProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('MINERD App'),
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenido a la App de MINERD',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/registro-incidencia');
              },
              icon: Icon(Icons.add),
              label: Text('Registrar Incidencia'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/registro-visita');
              },
              icon: Icon(Icons.add),
              label: Text('Registrar Visita'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/lista-visitas');
              },
              icon: Icon(Icons.list),
              label: Text('Ver Visitas Registradas'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/lista-incidencias');
              },
              icon: Icon(Icons.list),
              label: Text('Ver Incidencias Registradas'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/mapa-visitas');
              },
              icon: Icon(Icons.map),
              label: Text('Mapa de Visitas'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/noticias');
              },
              icon: Icon(Icons.newspaper),
              label: Text('Ver Noticias'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/estado-clima');
              },
              icon: Icon(Icons.wb_sunny),
              label: Text('Estado del Clima'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/horoscopo');
              },
              icon: Icon(Icons.star),
              label: Text('Horóscopo'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                _showDeleteConfirmationDialog(
                    context, incidenciaProvider, visitaProvider);
              },
              icon: Icon(Icons.delete),
              label: Text('Borrar Todos los Datos'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context,
      IncidenciaProvider incidenciaProvider, VisitaProvider visitaProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar Borrado'),
          content: Text(
              '¿Estás seguro de que deseas borrar todos los datos de emergencia?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Borrar'),
              onPressed: () {
                incidenciaProvider.deleteAllIncidencias();
                visitaProvider.deleteAllVisitas();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('Todos los datos han sido borrados por seguridad'),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
