import 'package:flutter/material.dart';

class ActivityCategory extends StatelessWidget {
  final String name;
  final IconData icon;

  ActivityCategory({@required this.name, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 32.0,
        ),
        Padding(padding: EdgeInsets.only(left: 5.0, right: 5.0)),
        Text(
          name,
          style: TextStyle(fontSize: 20.0),
        ),
      ],
    );
  }
}