import 'package:flutter/material.dart';
import '../models/visita_model.dart';

class DetalleVisitaScreen extends StatelessWidget {
  final Visita visita;

  DetalleVisitaScreen({required this.visita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle de Visita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cédula del Director: ${visita.cedulaDirector}'),
            Text('Código del Centro: ${visita.codigoCentro}'),
            Text('Motivo: ${visita.motivo}'),
            Text('Comentario: ${visita.comentario}'),
            Text(
                'Fecha: ${DateTime.parse(visita.fecha).toLocal().toString().split(' ')[0]}'),
            Text('Hora: ${visita.hora}'),
            // Verificación de nullidad y de que no esté vacío antes de mostrar la imagen
            visita.fotoEvidenciaPath != null &&
                    visita.fotoEvidenciaPath!.isNotEmpty
                ? Image.network(visita.fotoEvidenciaPath!)
                : Text('No hay foto evidencia disponible'),
          ],
        ),
      ),
    );
  }
}
