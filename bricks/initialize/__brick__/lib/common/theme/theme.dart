import 'package:flutter/material.dart' hide Colors, Typography;
import 'package:flutter/services.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      extensions: [
        Colors.light,
        Typography.typography,
      ],
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      colorScheme: ColorScheme.light(
        background: Colors.light.background,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      extensions: [
        Colors.dark,
        Typography.typography,
      ],
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      colorScheme: ColorScheme.dark(
        background: Colors.dark.background,
      ),
    );
  }
}
