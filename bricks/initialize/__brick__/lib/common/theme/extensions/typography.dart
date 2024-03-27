import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'typography.tailor.dart';

@TailorMixin(themeGetter: ThemeGetter.onBuildContext)
class Typography extends ThemeExtension<Typography>
    with _$TypographyTailorMixin {
  const Typography({
    required this.body1,
  });

  @override
  final TextStyle body1;

  // ignore: prefer_constructors_over_static_methods
  static Typography typography(Color color) => const Typography(
        body1: TextStyle(),
      );
}
