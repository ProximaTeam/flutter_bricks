import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'typography.tailor.dart';

@Tailor(
  themes: ['typography'],
  themeGetter: ThemeGetter.onBuildContext,
)
class _$Typography {
  static List<TextStyle> body1 = [const TextStyle()];
}
