import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/incidencia_model.dart';
import '../providers/incidencia_provider.dart';
import '../services/api_service.dart';

class ListaIncidenciasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Incidencias'),
      ),
      body: FutureBuilder(
        future: Provider.of<IncidenciaProvider>(context, listen: false)
            .loadIncidencias(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          } else {
            return Consumer<IncidenciaProvider>(
              builder: (context, incidenciaProvider, child) {
                return ListView.builder(
                  itemCount: incidenciaProvider.incidencias.length,
                  itemBuilder: (context, index) {
                    final incidencia = incidenciaProvider.incidencias[index];
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
                      leading: incidencia.fotoPath != null &&
                              incidencia.fotoPath!.isNotEmpty
                          ? Image.network(incidencia.fotoPath!)
                          : Icon(Icons.image_not_supported),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
