import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String title;

  CustomHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
