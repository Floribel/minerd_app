import 'package:flutter/material.dart';
import '../models/incidencia_model.dart';

class DetalleIncidenciaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final incidencia = ModalRoute.of(context)!.settings.arguments as Incidencia;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle de Incidencia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Título: ${incidencia.titulo}'),
            Text('Centro Educativo: ${incidencia.centroEducativo}'),
            Text('Regional: ${incidencia.regional}'),
            Text('Distrito: ${incidencia.distrito}'),
            Text('Fecha: ${incidencia.fecha}'),
            Text('Descripción: ${incidencia.descripcion}'),
            if (incidencia.fotoPath != null && incidencia.fotoPath!.isNotEmpty)
              Image.network(incidencia.fotoPath!),
            if (incidencia.audioPath != null &&
                incidencia.audioPath!.isNotEmpty)
              Text('Audio: ${incidencia.audioPath!}'),
          ],
        ),
      ),
    );
  }
}
