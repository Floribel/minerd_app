import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../models/incidencia_model.dart';
import '../providers/incidencia_provider.dart';

class RegistroIncidenciaScreen extends StatefulWidget {
  @override
  _RegistroIncidenciaScreenState createState() =>
      _RegistroIncidenciaScreenState();
}

class _RegistroIncidenciaScreenState extends State<RegistroIncidenciaScreen> {
  final _formKey = GlobalKey<FormState>();
  String _titulo = '';
  String _centroEducativo = '';
  String _regional = '';
  String _distrito = '';
  String _descripcion = '';
  String? _fotoUrl;
  final ImagePicker _picker = ImagePicker();

  void _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      // Aquí normalmente deberías subir la imagen a un servidor y obtener una URL
      // Para fines de demostración, estamos simulando una URL
      setState(() {
        _fotoUrl = 'https://example.com/fake-url/${pickedFile.name}';
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Incidencia nuevaIncidencia = Incidencia(
        titulo: _titulo,
        centroEducativo: _centroEducativo,
        regional: _regional,
        distrito: _distrito,
        fecha: DateTime.now().toIso8601String(),
        descripcion: _descripcion,
        fotoPath: _fotoUrl ?? '',
        audioPath: '',
      );

      Provider.of<IncidenciaProvider>(context, listen: false)
          .insertarIncidencia(nuevaIncidencia);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Incidencia registrada exitosamente'),
      ));

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Incidencia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Título'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un título';
                  }
                  return null;
                },
                onSaved: (value) {
                  _titulo = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Centro Educativo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el centro educativo';
                  }
                  return null;
                },
                onSaved: (value) {
                  _centroEducativo = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Regional'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la regional';
                  }
                  return null;
                },
                onSaved: (value) {
                  _regional = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Distrito'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el distrito';
                  }
                  return null;
                },
                onSaved: (value) {
                  _distrito = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descripción'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una descripción';
                  }
                  return null;
                },
                onSaved: (value) {
                  _descripcion = value!;
                },
              ),
              SizedBox(height: 20),
              _fotoUrl != null ? Image.network(_fotoUrl!) : Container(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Tomar Foto'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Registrar Incidencia'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
