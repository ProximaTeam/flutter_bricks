import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      extensions: [
        Colors.light,
        Typography.typography,
      ],
    );
  }

  static ThemeData get dark {
    return ThemeData(
      extensions: [
        Colors.dark,
        Typography.typography,
      ],
    );
  }
}
