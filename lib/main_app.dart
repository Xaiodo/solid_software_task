import 'package:flutter/material.dart';
import 'package:solid_software_task/color_extension.dart';

import 'package:solid_software_task/mixins/color_generator_mixin.dart';
import 'package:solid_software_task/storage.dart/local_storage_impl.dart';
import 'package:solid_software_task/storage.dart/storage.dart';

Future<void> main() async {
  final storage = await LocalStorageImpl.init();
  runApp(MainApp(storage));
}

/// This is the main application widget.
class MainApp extends StatelessWidget {
  /// MainApp constructor with parameter key.
  const MainApp(this.storage, {super.key});

  /// Storage instance to save and retrieve colors.
  final Storage storage;

  /// Title of the application.
  static const String title = 'Background Color Change App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: BackgroundColorChangeWidget(storage: storage),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// [StatefulWidget] that allows changing the background color.
class BackgroundColorChangeWidget extends StatefulWidget {
  /// Constructs a [BackgroundColorChangeWidget] with a key parameter.
  const BackgroundColorChangeWidget({
    required this.storage,
    super.key,
  });

  /// Field to store the storage instance.
  final Storage storage;

  @override
  State<BackgroundColorChangeWidget> createState() =>
      _BackgroundColorChangeWidgetState();
}

class _BackgroundColorChangeWidgetState
    extends State<BackgroundColorChangeWidget> with ColorGeneratorMixin {
  // Field to store the hello text.
  static const String helloText = 'Hello there';

  /// Field to store the background color.
  late Color _backgroundColor = widget.storage.color;

  // Method to change the background color.
  void _changeBackgroundColor() {
    final generatedColor = generateRandomColor();

    setState(() {
      _backgroundColor = generatedColor;
    });

    widget.storage.saveColors(
      backgroundColor: _backgroundColor,
    );
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: _changeBackgroundColor,
        child: Scaffold(
          backgroundColor: _backgroundColor,
          body: Center(
            child: Text(
              helloText,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: _backgroundColor.invertedColor,
              ),
            ),
          ),
        ),
      );
}
