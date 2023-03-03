// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'typography.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class Typography extends ThemeExtension<Typography> {
  const Typography({
    required this.body1,
  });

  final TextStyle body1;

  static final Typography typography = Typography(
    body1: _$Typography.body1[0],
  );

  static final themes = [
    typography,
  ];

  @override
  Typography copyWith({
    TextStyle? body1,
  }) {
    return Typography(
      body1: body1 ?? this.body1,
    );
  }

  @override
  Typography lerp(ThemeExtension<Typography>? other, double t) {
    if (other is! Typography) return this;
    return Typography(
      body1: TextStyle.lerp(body1, other.body1, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Typography &&
            const DeepCollectionEquality().equals(body1, other.body1));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, const DeepCollectionEquality().hash(body1));
  }
}

extension TypographyBuildContext on BuildContext {
  Typography get typography => Theme.of(this).extension<Typography>()!;
}
