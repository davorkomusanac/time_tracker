import 'package:flutter/material.dart';
import 'package:time_tracker/utils/constants.dart';

AppBar baseAppBar() {
  return AppBar(
    title: Text('Time Tracker'),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.add,
        ),
        onPressed: () {
          print('Add button was pressed');
        },
      ),
      PopupMenuButton<String>(
        onSelected: (value) {
          print(value);
        },
        itemBuilder: (context) {
          return choices;
        },
      ),
    ],
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(48.0),
      child: Container(
        height: 48.0,
        alignment: Alignment.center,
        child: TabBar(
          indicatorColor: Colors.red,
          tabs: [
            Tab(
              icon: Icon(Icons.calendar_view_day),
            ),
            Tab(
              icon: Icon(Icons.timer),
            ),
            Tab(
              icon: Icon(Icons.insert_chart),
            ),
          ],
        ),
      ),
    ),
  );
}
