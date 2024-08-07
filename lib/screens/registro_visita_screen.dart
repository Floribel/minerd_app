import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../models/visita_model.dart';
import '../providers/visita_provider.dart';

class RegistroVisitaScreen extends StatefulWidget {
  final Key? key;

  RegistroVisitaScreen({this.key}) : super(key: key);

  @override
  _RegistroVisitaScreenState createState() => _RegistroVisitaScreenState();
}

class _RegistroVisitaScreenState extends State<RegistroVisitaScreen> {
  final _formKey = GlobalKey<FormState>();
  String _cedulaDirector = '';
  String _codigoCentro = '';
  String _motivo = '';
  String _comentario = '';
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

      Visita nuevaVisita = Visita(
        cedulaDirector: _cedulaDirector,
        codigoCentro: _codigoCentro,
        motivo: _motivo,
        fotoEvidenciaPath: _fotoUrl ?? '',
        comentario: _comentario,
        notaVozPath: '',
        latitud: 0.0,
        longitud: 0.0,
        fecha: DateTime.now().toIso8601String(),
        hora: TimeOfDay.now().format(context),
      );

      Provider.of<VisitaProvider>(context, listen: false)
          .insertarVisita(nuevaVisita);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Visita registrada exitosamente'),
      ));

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Visita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Cédula del Director'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la cédula del director';
                  }
                  return null;
                },
                onSaved: (value) {
                  _cedulaDirector = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Código del Centro'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el código del centro';
                  }
                  return null;
                },
                onSaved: (value) {
                  _codigoCentro = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Motivo de la Visita'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el motivo de la visita';
                  }
                  return null;
                },
                onSaved: (value) {
                  _motivo = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Comentario'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un comentario';
                  }
                  return null;
                },
                onSaved: (value) {
                  _comentario = value!;
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
                child: Text('Registrar Visita'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
