import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/incidencia_provider.dart';
import '../providers/visita_provider.dart';

class ConfiguracionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final incidenciaProvider = Provider.of<IncidenciaProvider>(context);
    final visitaProvider = Provider.of<VisitaProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                _showDeleteConfirmationDialog(
                    context, incidenciaProvider, visitaProvider);
              },
              icon: Icon(Icons.delete),
              label: Text('Borrar Todos los Datos'),
            ),
            // Aquí puedes agregar más opciones de configuración según sea necesario
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
