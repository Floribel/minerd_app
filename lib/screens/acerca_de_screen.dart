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
              backgroundImage: tecnico?.fotoPath != null
                  ? NetworkImage(tecnico!.fotoPath)
                  : AssetImage('assets/images/profile_placeholder.png')
                      as ImageProvider,
            ),
            SizedBox(height: 20),
            Text(
              'Nombre: ${tecnico?.nombre ?? 'N/A'} ${tecnico?.apellido ?? 'N/A'}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Matrícula: ${tecnico?.matricula ?? 'N/A'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Reflexión: "${tecnico?.reflexion ?? 'N/A'}"',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
