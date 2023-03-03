// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'colors.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class Colors extends ThemeExtension<Colors> {
  const Colors({
    required this.background,
  });

  final Color background;

  static final Colors light = Colors(
    background: _$Colors.background[0],
  );

  static final Colors dark = Colors(
    background: _$Colors.background[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  Colors copyWith({
    Color? background,
  }) {
    return Colors(
      background: background ?? this.background,
    );
  }

  @override
  Colors lerp(ThemeExtension<Colors>? other, double t) {
    if (other is! Colors) return this;
    return Colors(
      background: Color.lerp(background, other.background, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Colors &&
            const DeepCollectionEquality()
                .equals(background, other.background));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, const DeepCollectionEquality().hash(background));
  }
}

extension ColorsBuildContext on BuildContext {
  Colors get colors => Theme.of(this).extension<Colors>()!;
}
