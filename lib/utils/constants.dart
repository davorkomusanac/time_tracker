import 'package:flutter/material.dart';

const kPopupMenuItemStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
  color: Colors.black,
);

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
