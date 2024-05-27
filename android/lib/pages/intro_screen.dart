import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  final VoidCallback onStart;

  const IntroScreen({Key? key, required this.onStart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¡Bienvenido a Grocery Shop!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: onStart, // Llama a la función onStart cuando se presiona el botón
              child: Text('Empezar'),
            ),
          ],
        ),
      ),
    );
  }
}
