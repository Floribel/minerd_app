import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/incidencia_provider.dart';

class ListaIncidenciasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final incidencias = Provider.of<IncidenciaProvider>(context).incidencias;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Incidencias'),
      ),
      body: ListView.builder(
        itemCount: incidencias.length,
        itemBuilder: (context, index) {
          final incidencia = incidencias[index];
          return ListTile(
            title: Text(incidencia.titulo),
            subtitle: Text(incidencia.fecha),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detalle-incidencia',
                arguments: incidencia,
              );
            },
            leading:
                incidencia.fotoPath != null && incidencia.fotoPath!.isNotEmpty
                    ? Image.network(incidencia.fotoPath!)
                    : Icon(Icons.image_not_supported),
          );
        },
      ),
    );
  }
}
