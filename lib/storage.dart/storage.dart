import 'dart:ui';

/// Interface for storing and retrieving colors.
abstract class Storage {
  /// Saves the background and inverted colors.
  ///
  /// The [backgroundColor] parameter represents the background color
  Future<void> saveColors({required Color backgroundColor});

  /// Retrieves the background and inverted colors.
  ///
  /// Returns a tuple of two colors, where the first element represents the
  /// background color and the second element represents the color of text or
  /// elements displayed on the background.
  Color get color;
}
