import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/registro_incidencia_screen.dart';
import 'screens/detalle_incidencia_screen.dart';
import 'screens/detalle_visita_screen.dart';
import 'providers/incidencia_provider.dart';
import 'providers/visita_provider.dart';
import 'utils/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => IncidenciaProvider()),
        ChangeNotifierProvider(create: (_) => VisitaProvider()),
      ],
      child: MinerdApp(),
    ),
  );
}

class MinerdApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MINERD App',
      theme: CustomTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/registro-incidencia': (context) => RegistroIncidenciaScreen(),
        '/detalle-incidencia': (context) => DetalleIncidenciaScreen(),
        '/detalle-visita': (context) => DetalleVisitaScreen(),
      },
    );
  }
}
