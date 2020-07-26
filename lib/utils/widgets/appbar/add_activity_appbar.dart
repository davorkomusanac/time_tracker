import 'package:flutter/material.dart';

class AddActivityScreenBar extends StatelessWidget with PreferredSizeWidget {
  final Function onSaveCallback;

  AddActivityScreenBar({this.onSaveCallback});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
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
              onPressed: onSaveCallback,
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
}
