import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    // ignore: deprecated_member_use
    surfaceBright:  Color.fromARGB(255, 218, 230, 244),
    primary:  Colors.white70.withOpacity(0.5),
    secondary: Colors.white,
    inversePrimary: Colors.grey.shade700,
  ),
);
