import 'package:flutter/material.dart';

import 'theme.dart';

class DarkAppThemeImpl implements AppTheme {
  const DarkAppThemeImpl();

  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.orange,
          onPrimary: Colors.black87,
          secondary: Colors.cyan.shade600,
          onSecondary: Colors.black54,
          surface: Colors.blueGrey.shade900,
          onSurface: Colors.white70,
          background: Colors.black87,
          onBackground: Colors.grey.shade100,
          error: Colors.red,
          onError: Colors.black,
        ),
      );
}
