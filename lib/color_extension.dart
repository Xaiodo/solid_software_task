import 'dart:ui';

/// Extension to enhance the [Color] class.
extension ColorExtension on Color {
  /// Inverts the given color.
  ///
  /// If the brightness of the color is less than the threshold, returns white.
  /// Otherwise, returns black.

  /// Brightness threshold to determine the color to be used for text.
  static const double brightnessThreshold = 0.5;

  /// Getter to get the inverted color.
  Color get invertedColor {
    final brightness = computeLuminance();

    // If the brightness is less than the threshold, return white; otherwise,
    // return black.
    return brightness < brightnessThreshold
        ? const Color(0xFFFFFFFF)
        : const Color(0xFF000000);
  }
}
