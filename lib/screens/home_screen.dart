import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/logic/activities.dart';
import 'package:time_tracker/logic/activities_history.dart';
import 'package:time_tracker/utils/constants.dart';
import 'package:time_tracker/utils/widgets/appbar/home_screen_appbar.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  final List<Widget> tabBodyText = [
    Padding(
      padding: const EdgeInsets.all(4.0),
      child: Consumer<ActivitiesHistory>(
        builder: (context, activitiesHistory, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final activity = activitiesHistory.activitiesTracker[index];
              return Card(
                margin: EdgeInsets.all(5.0),
                elevation: 5.0,
                child: ListTile(
                  contentPadding: EdgeInsets.only(right: 5.0),
                  dense: true,
                  title: activity.activity,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          activity.timePeriod,
                          style: kTimePeriodTextStyle,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                        child: Text(
                          activity.timeSpent,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: activitiesHistory.activitiesTracker.length,
          );
        },
      ),
    ),
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
    // Text('THIRD'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: homeScreenAppBar(context),
        body: TabBarView(children: tabBodyText),
      ),
    );
  }
}
