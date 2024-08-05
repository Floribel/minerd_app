import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/incidencia_model.dart';
import '../providers/incidencia_provider.dart';

class RegistroIncidenciaScreen extends StatelessWidget {
  final _tituloController = TextEditingController();
  final _descripcionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Incidencia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: _descripcionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final incidencia = Incidencia(
                  id: 0,
                  titulo: _tituloController.text,
                  centroEducativo: 'Centro Ejemplo',
                  regional: 'Regional Ejemplo',
                  distrito: 'Distrito Ejemplo',
                  fecha: DateTime.now(),
                  descripcion: _descripcionController.text,
                  fotoPath: '',
                  audioPath: '',
                );
                Provider.of<IncidenciaProvider>(context, listen: false)
                    .addIncidencia(incidencia);
                Navigator.pop(context);
              },
              child: Text('Guardar Incidencia'),
            ),
          ],
        ),
      ),
    );
  }
}
