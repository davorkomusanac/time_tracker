import 'package:flutter/material.dart';

const kPopupMenuItemStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
  color: Colors.black,
);

const kCardColor = Color(0xFFe0e0e0);

const kAddActivityTextStyle = TextStyle(
  fontSize: 16.0,
);

final kAddActivityBoxDecoration = BoxDecoration(
    color: kCardColor,
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(blurRadius: 4.0),
    ]);

const kAddActivityInputDecoration = InputDecoration(
  isDense: true,
  contentPadding: EdgeInsets.symmetric(
    horizontal: 30.0,
    vertical: 5.0,
  ),
);
