import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  final VoidCallback? onPressed;
  final double width;
  final double height;

  const CustomButton(
      {Key? key,
      required this.text,
      required this.color,
      required this.icon,
      required this.onPressed,
      this.width = 50,
      this.height = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(text),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
