import 'package:flutter/material.dart';
import '../models/incidencia_model.dart';

class DetalleIncidenciaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Incidencia incidencia =
        ModalRoute.of(context)!.settings.arguments as Incidencia;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle de Incidencia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              incidencia.titulo,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Centro Educativo: ${incidencia.centroEducativo}'),
            Text('Regional: ${incidencia.regional}'),
            Text('Distrito: ${incidencia.distrito}'),
            Text(
                'Fecha: ${incidencia.fecha.toLocal().toString().split(' ')[0]}'),
            SizedBox(height: 20),
            Text(
              'Descripción:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Text(incidencia.descripcion),
            SizedBox(height: 20),
            incidencia.fotoPath.isNotEmpty
                ? Image.asset(incidencia.fotoPath)
                : Text('No hay foto disponible'),
            SizedBox(height: 10),
            incidencia.audioPath.isNotEmpty
                ? ElevatedButton(
                    onPressed: () {
                      // Lógica para reproducir audio
                    },
                    child: Text('Reproducir Audio'),
                  )
                : Text('No hay audio disponible'),
          ],
        ),
      ),
    );
  }
}
