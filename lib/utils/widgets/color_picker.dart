import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class ColorPicker extends ChangeNotifier {
  ColorSwatch _mainColor = Colors.blue;
  BuildContext context;

  ColorPicker(this.context);

  void _openDialog(Widget content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text('Set Color'),
          content: content,
          actions: [
            FlatButton(
              child: Text('CANCEL'),
              onPressed: Navigator.of(context).pop,
            ),
          ],
        );
      },
    );
  }

  void openMainColorPicker() async {
    _openDialog(
      MaterialColorPicker(
          selectedColor: _mainColor,
          colors: fullMaterialColors,
          allowShades: false,
          onMainColorChange: (color) {
            _mainColor = color;
            notifyListeners();
            Navigator.pop(context);
          }),
    );
  }

  ColorSwatch getColor() {
    return _mainColor;
  }
}
