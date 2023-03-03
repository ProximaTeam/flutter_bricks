import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'colors.tailor.dart';

@Tailor(themeGetter: ThemeGetter.onBuildContext)
class _$Colors {
  static List<Color> background = [
    const Color(0xffffffff),
    const Color(0xFF000000)
  ];
}
