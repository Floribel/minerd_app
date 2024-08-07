import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tecnico_provider.dart';
import '../models/tecnico_model.dart';

class RegisterScreen extends StatelessWidget {
  final _cedulaController = TextEditingController();
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _claveController = TextEditingController();
  final _correoController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _fechaNacimientoController = TextEditingController();

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
              controller: _cedulaController,
              decoration: const InputDecoration(labelText: 'Cédula'),
            ),
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _apellidoController,
              decoration: const InputDecoration(labelText: 'Apellido'),
            ),
            TextField(
              controller: _claveController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            TextField(
              controller: _correoController,
              decoration: const InputDecoration(labelText: 'Correo'),
            ),
            TextField(
              controller: _telefonoController,
              decoration: const InputDecoration(labelText: 'Teléfono'),
            ),
            TextField(
              controller: _fechaNacimientoController,
              decoration:
                  const InputDecoration(labelText: 'Fecha de Nacimiento'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final tecnicoProvider =
                    Provider.of<TecnicoProvider>(context, listen: false);

                // Crea un objeto Técnico con los datos ingresados
                final nuevoTecnico = Tecnico(
                  cedula: _cedulaController.text,
                  nombre: _nombreController.text,
                  apellido: _apellidoController.text,
                  clave: _claveController.text,
                  correo: _correoController.text,
                  telefono: _telefonoController.text,
                  fechaNacimiento: _fechaNacimientoController.text,
                );

                bool registrado =
                    await tecnicoProvider.registerTecnico(nuevoTecnico);

                if (registrado) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Técnico registrado exitosamente'),
                  ));

                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Error en el registro. Por favor, revisa los campos.'),
                  ));
                }
              },
              child: const Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
