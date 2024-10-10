// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:fade_shimmer/fade_shimmer.dart';

// Project imports:

class AppFadeShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final int millisecondsDelay;
  final EdgeInsetsGeometry? padding;

  const AppFadeShimmer({
    super.key,
    required this.width,
    required this.height,
    this.radius = 0,
    this.millisecondsDelay = 0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: FadeShimmer(
        width: width,
        height: height,
        radius: radius,
        highlightColor: const Color(0xFFF0F0F3),
        baseColor: const Color(0xFFD1D3D6),
        millisecondsDelay: millisecondsDelay,
      ),
    );
  }
}

class CircleFadeShimmer extends StatelessWidget {
  final double size;
  final Color? baseColor;
  final Color? highlightColor;
  final int millisecondsDelay;
  final EdgeInsetsGeometry? padding;

  const CircleFadeShimmer({
    super.key,
    required this.size,
    this.baseColor,
    this.highlightColor,
    this.millisecondsDelay = 0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: FadeShimmer.round(
        size: size,
        fadeTheme: FadeTheme.light,
        baseColor: baseColor,
        highlightColor: highlightColor,
        millisecondsDelay: millisecondsDelay,
      ),
    );
  }
}
