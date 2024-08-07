import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tecnico_provider.dart';

class AcercaDeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tecnico = Provider.of<TecnicoProvider>(context).loggedInTecnico;

    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/images/profile_placeholder.png')
                      as ImageProvider,
            ),
            SizedBox(height: 20),
            Text(
              'Nombre: ${tecnico?.nombre ?? 'N/A'} ${tecnico?.apellido ?? 'N/A'}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Cédula: ${tecnico?.cedula ?? 'N/A'}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Correo: ${tecnico?.correo ?? 'N/A'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Fecha de Nacimiento: ${tecnico?.fechaNacimiento ?? 'N/A'}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
