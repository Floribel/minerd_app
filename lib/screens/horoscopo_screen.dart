import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HoroscopoScreen extends StatefulWidget {
  @override
  _HoroscopoScreenState createState() => _HoroscopoScreenState();
}

class _HoroscopoScreenState extends State<HoroscopoScreen> {
  String? _horoscopo;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchHoroscopo();
  }

  void _fetchHoroscopo() async {
    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('https://api.xoroscopo.com/v1/today?signo=aries');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _horoscopo = data['horoscope'];
        _isLoading = false;
      });
    } else {
      setState(() {
        _horoscopo = 'Error al obtener el horóscopo';
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al consultar el horóscopo')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horóscopo Diario'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _horoscopo != null
                ? Text('Horóscopo de hoy: $_horoscopo')
                : Text('No se pudo obtener el horóscopo'),
      ),
    );
  }
}
