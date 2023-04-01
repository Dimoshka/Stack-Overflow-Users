import 'package:flutter/material.dart';

import 'theme.dart';

class LightAppThemeImpl implements AppTheme {
  const LightAppThemeImpl();

  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: Colors.orange,
            onPrimary: Colors.black87,
            secondary: Colors.cyan.shade600,
            onSecondary: Colors.black54,
            surface: Colors.white,
            onSurface: Colors.blueGrey.shade900,
            background: Colors.white,
            onBackground: Colors.black87,
            error: Colors.red,
            onError: Colors.black),
      );
}
