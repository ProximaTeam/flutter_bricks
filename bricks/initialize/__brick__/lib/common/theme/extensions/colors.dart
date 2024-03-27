import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'colors.tailor.dart';

@TailorMixin(themeGetter: ThemeGetter.onBuildContext)
class Colors extends ThemeExtension<Colors> with _$ColorsTailorMixin {
  const Colors({
    required this.transparent,
    required this.background,
    required this.text,
  });

  @override
  final Color transparent;
  @override
  final Color background;
  @override
  final Color text;

  static Colors light = const Colors(
    transparent: Color(0x00000000),
    background: Color(0xffffffff),
    text: Color(0xFF000000),
  );

  static Colors dark = const Colors(
    transparent: Color(0x00000000),
    background: Color(0xff000000),
    text: Color(0xffffffff),
  );
}
