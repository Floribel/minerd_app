import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaVisitasScreen extends StatelessWidget {
  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa de Visitas'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
              18.735693, -70.162651), // Coordenadas de la República Dominicana
          zoom: 7,
        ),
        markers: _markers,
      ),
    );
  }

  void _cargarMarcadores() {
    // Aquí agregas los marcadores de las visitas realizadas
    _markers.add(
      Marker(
        markerId: MarkerId('visita_1'),
        position: LatLng(18.473, -69.912),
        infoWindow: InfoWindow(
          title: 'Visita a Escuela Ejemplo',
          snippet: 'Motivo: Supervisión',
        ),
      ),
    );
  }
}
