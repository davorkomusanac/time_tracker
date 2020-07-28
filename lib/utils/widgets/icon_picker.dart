import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class IconPicker extends ChangeNotifier {
  BuildContext context;
  IconData _iconData;

  IconPicker(BuildContext context) {
    _iconData = Icons.access_time;
    this.context = context;
  }

  void pickIcon() async {
    _iconData = await FlutterIconPicker.showIconPicker(
      context,
      adaptiveDialog: false,
      iconPickerShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      iconPackMode: IconPack.material,
    );
    if (_iconData == null) {
      _iconData = Icons.access_time;
    }
    notifyListeners();
  }

  IconData get getIconData {
    return _iconData;
  }
}
