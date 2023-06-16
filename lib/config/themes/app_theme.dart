import 'package:flutter/material.dart';

const List<Color> colorThemes = [
  Colors.blueAccent,
  Colors.blue,
  Colors.lightBlue,
  Colors.lightBlueAccent,
  Colors.cyan,
  Colors.cyanAccent,
  Colors.blueGrey,
  Colors.teal,
  Colors.tealAccent,
  Colors.red,
  Colors.redAccent,
  Colors.pink,
  Colors.pinkAccent,
  Colors.deepOrange,
  Colors.deepOrangeAccent,
  Colors.orange,
  Colors.orangeAccent,
  Colors.yellow,
  Colors.yellowAccent,
  Colors.amber,
  Colors.amberAccent,
  Colors.lime,
  Colors.limeAccent,
  Colors.green,
  Colors.greenAccent,
  Colors.lightGreen,
  Colors.lightGreenAccent,
  Colors.purple,
  Colors.purpleAccent,
  Colors.deepPurple,
  Colors.deepPurpleAccent,
  Colors.indigo,
  Colors.indigoAccent,
  Colors.brown,
  Colors.grey,
  Colors.white,
  Colors.black12,
  Colors.black26,
  Colors.black38,
  Colors.black45,
  Colors.black54,
  Colors.black87,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkmode;

  AppTheme({this.selectedColor = 0, this.isDarkmode = false})
      : assert(selectedColor >= 0 && selectedColor <= colorThemes.length - 1,
            'selectedColor debe estar entre 0 y ${colorThemes.length}');

  ThemeData theme() {
    Color color = colorThemes[selectedColor];
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: color,
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
        appBarTheme: const AppBarTheme().copyWith(
            centerTitle: true,
            backgroundColor: color,
            foregroundColor: isDarkmode ? Colors.white : Colors.black),
        textTheme: ThemeData.light().textTheme.apply(
              fontFamily: "PTSansNarrow-Regular",
              bodyColor: isDarkmode ? Colors.white : Colors.black,
            ),
        primaryTextTheme: ThemeData.light().textTheme.apply(
              fontFamily: "PTSansNarrow-Regular",
              bodyColor: isDarkmode ? Colors.white : Colors.black,
            ));
  }

  AppTheme copyWith({int? selectedColor, bool? isDarkmode}) => AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        isDarkmode: isDarkmode ?? this.isDarkmode,
      );
}
