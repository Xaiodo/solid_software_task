import 'dart:math';

import 'package:flutter/material.dart';

/// Mixin to generate random colors and invert them.
mixin ColorGeneratorMixin {
  /// Random instance to perform randomization.
  Random random = Random();

  /// Maximum color value to generate random color.
  static const int maxColorValue = 256;

  /// Generates a random color and its inverted color.
  ///
  /// Returns a tuple of two colors: the generated color and its inverted color.
  Color generateRandomColor() => Color.fromRGBO(
        random.nextInt(maxColorValue),
        random.nextInt(maxColorValue),
        random.nextInt(maxColorValue),
        1,
      );
}
