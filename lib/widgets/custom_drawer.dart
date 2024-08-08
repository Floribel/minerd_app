import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'MINERD App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.report),
            title: Text('Registrar Incidencia'),
            onTap: () {
              Navigator.pushNamed(context, '/registro-incidencia');
            },
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Registrar Visita'),
            onTap: () {
              Navigator.pushNamed(context, '/registro-visita');
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Consulta de Escuelas'),
            onTap: () {
              Navigator.pushNamed(context, '/consulta-escuela');
            },
          ),
          ListTile(
            leading: Icon(Icons.person_search),
            title: Text('Consulta de Director'),
            onTap: () {
              Navigator.pushNamed(context, '/consulta-director');
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Ver Incidencias'),
            onTap: () {
              Navigator.pushNamed(context, '/lista-incidencias');
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Ver Visitas'),
            onTap: () {
              Navigator.pushNamed(context, '/lista-visitas');
            },
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Mapa de Visitas'),
            onTap: () {
              Navigator.pushNamed(context, '/mapa-visitas');
            },
          ),
          ListTile(
            leading: Icon(Icons.newspaper),
            title: Text('Noticias'),
            onTap: () {
              Navigator.pushNamed(context, '/noticias');
            },
          ),
          ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text('Estado del Clima'),
            onTap: () {
              Navigator.pushNamed(context, '/estado-clima');
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Horóscopo'),
            onTap: () {
              Navigator.pushNamed(context, '/horoscopo');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configuración'),
            onTap: () {
              Navigator.pushNamed(context, '/configuracion');
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Acerca de'),
            onTap: () {
              Navigator.pushNamed(context, '/acerca-de');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Cerrar Sesión'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
