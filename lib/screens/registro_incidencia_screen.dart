import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

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
  String? _fotoPath;
  String? _audioPath;
  final ImagePicker _picker = ImagePicker();

  void _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _fotoPath = pickedFile.path;
      });
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://adamix.net/minerd/def/registrar_incidencia.php'),
      );

      request.fields['titulo'] = _titulo;
      request.fields['centro_educativo'] = _centroEducativo;
      request.fields['regional'] = _regional;
      request.fields['distrito'] = _distrito;
      request.fields['descripcion'] = _descripcion;
      request.fields['fecha'] = DateTime.now().toIso8601String();

      if (_fotoPath != null) {
        request.files
            .add(await http.MultipartFile.fromPath('foto', _fotoPath!));
      }
      if (_audioPath != null) {
        request.files
            .add(await http.MultipartFile.fromPath('audio', _audioPath!));
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Incidencia registrada exitosamente'),
        ));
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error al registrar la incidencia'),
        ));
      }
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
              // Añadir otros campos de entrada aquí
              SizedBox(height: 20),
              _fotoPath != null ? Image.network(_fotoPath!) : Container(),
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
