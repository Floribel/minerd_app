import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/visita_model.dart';
import '../providers/visita_provider.dart';

class ListaVisitasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final visitas = Provider.of<VisitaProvider>(context).visitas;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Visitas'),
      ),
      body: ListView.builder(
        itemCount: visitas.length,
        itemBuilder: (context, index) {
          final visita = visitas[index];
          return ListTile(
            title: Text('Centro: ${visita.codigoCentro} - ${visita.motivo}'),
            subtitle: Text('${visita.fecha} - ${visita.hora}'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detalle-visita',
                arguments: visita,
              );
            },
            leading: visita.fotoEvidenciaPath != null &&
                    visita.fotoEvidenciaPath!.isNotEmpty
                ? Image.network(visita.fotoEvidenciaPath!)
                : Icon(Icons.image_not_supported),
          );
        },
      ),
    );
  }
}
