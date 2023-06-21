import 'package:flutter/material.dart';

class CheckStatusScreen extends StatelessWidget {
  const CheckStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return const Scaffold(
      body: Center(
        child: Center(
          child: Image(
            image: AssetImage('assets/loading.gif'),
            width: 450,
          ),
        ),
      ),
    );
  }
}
