import 'package:flutter/material.dart';
import 'package:time_tracker/utils/widgets/activity_card/activity_card.dart';
import 'package:time_tracker/logic/stopwatch.dart';
import 'package:provider/provider.dart';

class Activities extends ChangeNotifier {
  List<Padding> activities = [];

  void addActivity(
      {String activityName, IconData activityIcon, Color activityColor}) {
    var activity = ActivityCard(
      categoryName: activityName,
      categoryIcon: activityIcon,
      categoryColor: activityColor,
    );
    _addActivityWithStopWatch(activity);
  }

  void _addActivityWithStopWatch(ActivityCard activity) {
    var pad = Padding(
      padding: const EdgeInsets.all(4.0),
      child: ChangeNotifierProvider(
        create: (context) => ActivityStopWatch(),
        child: activity,
      ),
    );
    activities.add(pad);
    notifyListeners();
  }
}
