import 'package:flutter/material.dart';

const Color _myCustomColor = Color(0xFFA00404);
const List<Color> _colorThemes = [
  _myCustomColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  AppTheme({this.indexColorSelected = 0})
      : assert(
          indexColorSelected >= 0 && indexColorSelected < _colorThemes.length,
          'El indice del color debe estar entre 0 y ${_colorThemes.length}',
        );

  final int indexColorSelected;

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[indexColorSelected],
      //brightness: Brightness.dark,dark mode
    );
  }
}
