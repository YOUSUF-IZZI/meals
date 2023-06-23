import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

const error = Color(0xFFBA1A1A);
const neutral_variant = Color(0xFF5C5E66);


CustomColors lightCustomColors = const CustomColors(
  sourceError: Color(0xFFBA1A1A),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD5),
  onErrorContainer: Color(0xFF410002),
  sourceNeutralvariant: Color(0xFF5C5E66),
  neutralvariant: Color(0xFF345CA8),
  onNeutralvariant: Color(0xFFFFFFFF),
  neutralvariantContainer: Color(0xFFD8E2FF),
  onNeutralvariantContainer: Color(0xFF001A43),
);

CustomColors darkCustomColors = const CustomColors(
  sourceError: Color(0xFFBA1A1A),
  error: Color(0xFFFFB4AB),
  onError: Color(0xFF690004),
  errorContainer: Color(0xFF930009),
  onErrorContainer: Color(0xFFFFDAD5),
  sourceNeutralvariant: Color(0xFF5C5E66),
  neutralvariant: Color(0xFFAEC6FF),
  onNeutralvariant: Color(0xFF002E6B),
  neutralvariantContainer: Color(0xFF14448F),
  onNeutralvariantContainer: Color(0xFFD8E2FF),
);



/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceError,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.sourceNeutralvariant,
    required this.neutralvariant,
    required this.onNeutralvariant,
    required this.neutralvariantContainer,
    required this.onNeutralvariantContainer,
  });

  final Color? sourceError;
  final Color? error;
  final Color? onError;
  final Color? errorContainer;
  final Color? onErrorContainer;
  final Color? sourceNeutralvariant;
  final Color? neutralvariant;
  final Color? onNeutralvariant;
  final Color? neutralvariantContainer;
  final Color? onNeutralvariantContainer;

  @override
  CustomColors copyWith({
    Color? sourceError,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? sourceNeutralvariant,
    Color? neutralvariant,
    Color? onNeutralvariant,
    Color? neutralvariantContainer,
    Color? onNeutralvariantContainer,
  }) {
    return CustomColors(
      sourceError: sourceError ?? this.sourceError,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      sourceNeutralvariant: sourceNeutralvariant ?? this.sourceNeutralvariant,
      neutralvariant: neutralvariant ?? this.neutralvariant,
      onNeutralvariant: onNeutralvariant ?? this.onNeutralvariant,
      neutralvariantContainer: neutralvariantContainer ?? this.neutralvariantContainer,
      onNeutralvariantContainer: onNeutralvariantContainer ?? this.onNeutralvariantContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceError: Color.lerp(sourceError, other.sourceError, t),
      error: Color.lerp(error, other.error, t),
      onError: Color.lerp(onError, other.onError, t),
      errorContainer: Color.lerp(errorContainer, other.errorContainer, t),
      onErrorContainer: Color.lerp(onErrorContainer, other.onErrorContainer, t),
      sourceNeutralvariant: Color.lerp(sourceNeutralvariant, other.sourceNeutralvariant, t),
      neutralvariant: Color.lerp(neutralvariant, other.neutralvariant, t),
      onNeutralvariant: Color.lerp(onNeutralvariant, other.onNeutralvariant, t),
      neutralvariantContainer: Color.lerp(neutralvariantContainer, other.neutralvariantContainer, t),
      onNeutralvariantContainer: Color.lerp(onNeutralvariantContainer, other.onNeutralvariantContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///   * [CustomColors.sourceError]
  ///   * [CustomColors.error]
  ///   * [CustomColors.onError]
  ///   * [CustomColors.errorContainer]
  ///   * [CustomColors.onErrorContainer]
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith(
      sourceError: sourceError!.harmonizeWith(dynamic.primary),
      error: error!.harmonizeWith(dynamic.primary),
      onError: onError!.harmonizeWith(dynamic.primary),
      errorContainer: errorContainer!.harmonizeWith(dynamic.primary),
      onErrorContainer: onErrorContainer!.harmonizeWith(dynamic.primary),
    );
  }
}