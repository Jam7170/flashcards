import 'package:flutter/material.dart';

extension ColorExt on Color {
  Color darken(double d) {
    final hsl = HSLColor.fromColor(this);
    return hsl.withLightness((hsl.lightness - d).clamp(0.0, 1.0)).toColor();
  }

  Color lighten(double d) {
    final hsl = HSLColor.fromColor(this);
    return hsl.withLightness((hsl.lightness + d).clamp(0.0, 1.0)).toColor();
  }
}
