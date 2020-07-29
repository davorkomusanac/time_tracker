import 'package:flutter/material.dart';

class ActivityCategory extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;

  ActivityCategory(
      {@required this.name, @required this.icon, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 32.0,
          color: color,
        ),
        Padding(padding: EdgeInsets.only(left: 5.0, right: 5.0)),
        Flexible(
          fit: FlexFit.loose,
          child: Text(
            name,
            style: TextStyle(fontSize: 18.0),
            overflow: TextOverflow.fade,
          ),
        ),
      ],
    );
  }
}
