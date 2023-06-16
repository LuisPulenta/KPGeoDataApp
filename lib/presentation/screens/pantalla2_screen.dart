import 'package:flutter/material.dart';

class Pantalla2Screen extends StatelessWidget {
  const Pantalla2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla1Screen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Pantalla1Screen'),
      ),
    );
  }
}
