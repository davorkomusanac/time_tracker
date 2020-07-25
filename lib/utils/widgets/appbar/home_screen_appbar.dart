import 'package:flutter/material.dart';
import 'popup_menu.dart';
import 'package:time_tracker/screens/add_activity_screen.dart';

AppBar homeScreenAppBar(BuildContext context) {
  return AppBar(
    title: Text('Time Tracker'),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.pushNamed(context, AddActivityScreen.id);
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
