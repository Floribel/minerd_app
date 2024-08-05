import 'package:flutter/material.dart';

class ConsultaEscuelasScreen extends StatelessWidget {
  final TextEditingController _codigoEscuelaController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta de Escuelas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _codigoEscuelaController,
              decoration: InputDecoration(labelText: 'Código de la Escuela'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para buscar la escuela por código
              },
              child: Text('Buscar Escuela'),
            ),
          ],
        ),
      ),
    );
  }
}
