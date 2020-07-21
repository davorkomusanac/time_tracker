import 'package:flutter/material.dart';
import 'package:time_tracker/utils/constants.dart';
import 'package:time_tracker/utils/widgets/activity_card.dart';
import 'package:time_tracker/utils/widgets/activity_category.dart';
import 'package:time_tracker/utils/widgets/appbar.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  final List<Widget> tabBodyText = [
    Text('FIRST'),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child:
                ActivityCard(categoryName: 'Sleep', categoryIcon: Icons.hotel),
          ),
          ActivityCard(categoryName: 'Sleep', categoryIcon: Icons.hotel),
        ],
      ),
    ),
    Text('THIRD'),
  ];

  void _sendPickedChoice(String value) {
    //print()
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: baseAppBar(),
        body: TabBarView(children: tabBodyText),
      ),
    );
  }
}
