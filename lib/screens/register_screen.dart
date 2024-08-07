import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tecnico_provider.dart';
import '../models/tecnico_model.dart';

class RegisterScreen extends StatelessWidget {
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _matriculaController = TextEditingController();
  final _reflexionController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrarse'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _apellidoController,
              decoration: const InputDecoration(labelText: 'Apellido'),
            ),
            TextField(
              controller: _matriculaController,
              decoration: const InputDecoration(labelText: 'Matrícula'),
            ),
            TextField(
              controller: _reflexionController,
              decoration: const InputDecoration(labelText: 'Reflexión'),
            ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final tecnicoProvider =
                    Provider.of<TecnicoProvider>(context, listen: false);

                // Define un path de foto predeterminado
                const String fotoPath = 'assets/images/profile_photo.png';

                // Crea un objeto Técnico con los datos ingresados
                final nuevoTecnico = Tecnico(
                  nombre: _nombreController.text,
                  apellido: _apellidoController.text,
                  matricula: _matriculaController.text,
                  reflexion: _reflexionController.text,
                  username: _usernameController.text,
                  password: _passwordController.text,
                  fotoPath: fotoPath,
                );

                await tecnicoProvider.registerTecnico(nuevoTecnico);

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Técnico registrado exitosamente'),
                ));

                Navigator.pop(context);
              },
              child: const Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
