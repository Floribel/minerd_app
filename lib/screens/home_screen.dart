import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import 'package:provider/provider.dart';
import '../providers/incidencia_provider.dart';
import '../providers/visita_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final incidenciaProvider = Provider.of<IncidenciaProvider>(context);
    final visitaProvider = Provider.of<VisitaProvider>(context);

    // Cargar incidencias y visitas al iniciar
    incidenciaProvider.fetchIncidencias();
    visitaProvider.fetchVisitas();

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
            SizedBox(height: 20),
            Text(
              'Últimas Incidencias',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: incidenciaProvider.incidencias.length,
                itemBuilder: (context, index) {
                  final incidencia = incidenciaProvider.incidencias[index];
                  return ListTile(
                    title: Text(incidencia.titulo),
                    subtitle: Text(incidencia.descripcion),
                    onTap: () {
                      Navigator.pushNamed(context, '/detalle-incidencia',
                          arguments: incidencia);
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Últimas Visitas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: visitaProvider.visitas.length,
                itemBuilder: (context, index) {
                  final visita = visitaProvider.visitas[index];
                  return ListTile(
                    title: Text('Visita a ${visita.codigoCentro}'),
                    subtitle: Text('Motivo: ${visita.motivo}'),
                    onTap: () {
                      Navigator.pushNamed(context, '/detalle-visita',
                          arguments: visita);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
