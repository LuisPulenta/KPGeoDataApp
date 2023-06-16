import 'package:flutter/material.dart';

void openDialog(
    {required BuildContext context,
    required String title,
    required String message,
    required VoidCallback onPressed}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: onPressed,
          child: const Text('Aceptar'),
        ),
      ],
    ),
  );
}
