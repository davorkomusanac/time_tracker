import 'package:flutter/material.dart';

class AddActivityScreen extends StatelessWidget {
  static const String id = 'add_activity_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Activity'),
      ),
      body: Container(
        child: Text('HELLO WORLD'),
      ),
    );
  }
}
