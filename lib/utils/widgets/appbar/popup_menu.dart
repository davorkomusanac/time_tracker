import 'package:flutter/material.dart';
import 'package:time_tracker/utils/constants.dart';

PopupMenuItem<String> generatePopupMenuItem({String value, String title}) {
  return PopupMenuItem<String>(
    value: value,
    child: Text(title),
    textStyle: kPopupMenuItemStyle,
  );
}

List<PopupMenuItem<String>> choices = [
  generatePopupMenuItem(value: 'first', title: 'Categories'),
  generatePopupMenuItem(value: 'second', title: 'Archived Activities'),
  generatePopupMenuItem(value: 'third', title: 'Backup/Export database'),
  generatePopupMenuItem(value: 'fourth', title: 'Settings'),
  generatePopupMenuItem(value: 'fifth', title: 'Upgrade'),
];
