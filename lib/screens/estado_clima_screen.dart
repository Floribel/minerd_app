import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EstadoClimaScreen extends StatefulWidget {
  @override
  _EstadoClimaScreenState createState() => _EstadoClimaScreenState();
}

class _EstadoClimaScreenState extends State<EstadoClimaScreen> {
  String? _clima;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _obtenerUbicacion();
  }

  void _obtenerUbicacion() async {
    setState(() {
      _isLoading = true;
    });

    Position position = await _determinePosition();
    _consultarClima(position.latitude, position.longitude);
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('El servicio de ubicación está deshabilitado.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Los permisos de ubicación están denegados.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Los permisos de ubicación están permanentemente denegados, no se puede solicitar permisos.');
    }

    return await Geolocator.getCurrentPosition();
  }

  void _consultarClima(double latitud, double longitud) async {
    final url = Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=$latitud&longitude=$longitud&current_weather=true');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _clima =
            '${data['current_weather']['temperature']}°C, ${data['current_weather']['weathercode_description']}';
        _isLoading = false;
      });
    } else {
      setState(() {
        _clima = 'Error al obtener el clima';
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al consultar el clima')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estado del Clima'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _clima != null
                ? Text('Clima actual: $_clima')
                : Text('No se pudo obtener el clima'),
      ),
    );
  }
}
