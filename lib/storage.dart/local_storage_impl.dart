import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:solid_software_task/storage.dart/storage.dart';

/// Implementation of the [Storage] interface via SharedPreferences.
class LocalStorageImpl extends Storage {
  /// Key to store the background color.
  static const String backgroundColorKey = 'backgroundColor';

  /// Key to store the inverted color.
  static const String invertedColorKey = 'invertedColor';

  final SharedPreferences _prefs;

  /// Getter to retrieve the background color.
  @override
  Color get color {
    final backgroundColor = _prefs.getInt(backgroundColorKey);

    const int backgroundColorDefault = 0xFFFFFFFF;

    return Color(backgroundColor ?? backgroundColorDefault);
  }

  /// Private constructor to initialize the SharedPreferences instance.
  LocalStorageImpl._(this._prefs);

  /// Method to initialize the [LocalStorageImpl] instance.
  static Future<LocalStorageImpl> init() async {
    final prefs = await SharedPreferences.getInstance();

    return LocalStorageImpl._(prefs);
  }

  @override
  Future<void> saveColors({
    required Color backgroundColor,
  }) =>
      _prefs.setInt(backgroundColorKey, backgroundColor.value);
}
