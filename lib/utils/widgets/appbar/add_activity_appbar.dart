import 'package:flutter/material.dart';

AppBar addActivityScreenBar() {
  return AppBar(
    title: Text('Add Activity'),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          print('delete was pressed');
        },
      ),
      IconButton(
        icon: Icon(Icons.archive),
        onPressed: () {
          print('archive was pressed');
        },
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: SizedBox(
          width: 46.0,
          child: FlatButton(
            padding: EdgeInsets.all(0.0),
            onPressed: () {
              print('Save was pressed');
            },
            shape: CircleBorder(),
            child: Text(
              'SAVE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
