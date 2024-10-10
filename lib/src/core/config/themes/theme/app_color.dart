// custom_colors.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color base;
  final Color reverseBase;
  final Color primary;
  final Color secondary;
  final Color textPrimary;
  final Color textAccent;
  final Color textSecondary;
  final Color cardPrimary;
  final Color cardSecondary;
  final Color successColor;
  final Color errorColor;
  final Color warningColor;
  final SystemUiOverlayStyle systemUiOverlayStyle;

  AppColors({
    required this.base,
    required this.reverseBase,
    required this.primary,
    required this.secondary,
    required this.textPrimary,
    required this.textAccent,
    required this.textSecondary,
    required this.cardPrimary,
    required this.cardSecondary,
    required this.successColor,
    required this.errorColor,
    required this.warningColor,
    required this.systemUiOverlayStyle,
  });

  @override
  AppColors copyWith({
    Color? base,
    Color? reverseBase,
    Color? primary,
    Color? secondary,
    Color? textPrimary,
    Color? textAccent,
    Color? textSecondary,
    Color? cardPrimary,
    Color? cardSecondary,
    Color? successColor,
    Color? errorColor,
    Color? warningColor,
    SystemUiOverlayStyle? systemUiOverlayStyle,
  }) {
    return AppColors(
      base: base ?? this.base,
      reverseBase: reverseBase ?? this.reverseBase,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      textPrimary: textPrimary ?? this.textPrimary,
      textAccent: textAccent ?? this.textAccent,
      textSecondary: textSecondary ?? this.textSecondary,
      cardPrimary: cardPrimary ?? this.cardPrimary,
      cardSecondary: cardSecondary ?? this.cardSecondary,
      successColor: successColor ?? this.successColor,
      errorColor: errorColor ?? this.errorColor,
      warningColor: warningColor ?? this.warningColor,
      systemUiOverlayStyle: systemUiOverlayStyle ?? this.systemUiOverlayStyle,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      base: Color.lerp(base, other.base, t)!,
      reverseBase: Color.lerp(reverseBase, other.reverseBase, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textAccent: Color.lerp(textAccent, other.textAccent, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      cardPrimary: Color.lerp(cardPrimary, other.cardPrimary, t)!,
      cardSecondary: Color.lerp(cardSecondary, other.cardSecondary, t)!,
      successColor: Color.lerp(successColor, other.successColor, t)!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      warningColor: Color.lerp(warningColor, other.warningColor, t)!,
      systemUiOverlayStyle: other.systemUiOverlayStyle,
    );
  }
}
