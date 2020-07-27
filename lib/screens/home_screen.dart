import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/logic/activities.dart';
import 'package:time_tracker/utils/widgets/appbar/home_screen_appbar.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  final List<Widget> tabBodyText = [
    Text('FIRST'),
    Padding(
      padding: const EdgeInsets.all(4.0),
      child: Consumer<Activities>(
        builder: (context, activitiesData, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final activity = activitiesData.activities[index];
              return activity;
            },
            itemCount: activitiesData.activities.length,
          );
        },
      ),
    ),
    Text('THIRD'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: homeScreenAppBar(context),
        body: TabBarView(children: tabBodyText),
      ),
    );
  }
}
