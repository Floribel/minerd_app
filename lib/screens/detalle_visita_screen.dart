import 'package:flutter/material.dart';
import '../models/visita_model.dart';

class DetalleVisitaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Visita visita = ModalRoute.of(context)!.settings.arguments as Visita;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle de Visita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Código Centro: ${visita.codigoCentro}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Cédula Director: ${visita.cedulaDirector}'),
            Text('Motivo: ${visita.motivo}'),
            Text('Fecha: ${visita.fecha.toLocal().toString().split(' ')[0]}'),
            Text('Hora: ${visita.hora}'),
            SizedBox(height: 20),
            Text(
              'Comentario:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Text(visita.comentario),
            SizedBox(height: 20),
            visita.fotoEvidenciaPath.isNotEmpty
                ? Image.asset(visita.fotoEvidenciaPath)
                : Text('No hay foto disponible'),
            SizedBox(height: 10),
            visita.notaVozPath.isNotEmpty
                ? ElevatedButton(
                    onPressed: () {
                      // Lógica para reproducir nota de voz
                    },
                    child: Text('Reproducir Nota de Voz'),
                  )
                : Text('No hay nota de voz disponible'),
          ],
        ),
      ),
    );
  }
}
