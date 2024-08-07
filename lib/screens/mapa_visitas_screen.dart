import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/visita_provider.dart';
import '../models/visita_model.dart';

class MapaVisitasScreen extends StatefulWidget {
  @override
  _MapaVisitasScreenState createState() => _MapaVisitasScreenState();
}

class _MapaVisitasScreenState extends State<MapaVisitasScreen> {
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _loadVisitas();
  }

  void _loadVisitas() {
    final visitas = Provider.of<VisitaProvider>(context, listen: false).visitas;
    Set<Marker> markers = {};

    for (Visita visita in visitas) {
      markers.add(
        Marker(
          markerId: MarkerId(visita.id.toString()),
          position: LatLng(visita.latitud, visita.longitud),
          infoWindow: InfoWindow(
            title: visita.codigoCentro,
            snippet: visita.motivo,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detalle-visita',
                arguments: visita,
              );
            },
          ),
        ),
      );
    }

    setState(() {
      _markers = markers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa de Visitas'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target:
              LatLng(18.7357, -70.1627), // Coordenadas de República Dominicana
          zoom: 7,
        ),
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
      ),
    );
  }
}
