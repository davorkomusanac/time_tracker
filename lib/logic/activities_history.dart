import 'package:time_tracker/utils/widgets/activity_tracker.dart';
import 'package:flutter/material.dart';

class ActivitiesHistory extends ChangeNotifier {
  List<ActivityTracker> activitiesTracker = [];

  void addActivitySession(ActivityTracker activityTracker) {
    activitiesTracker.add(activityTracker);
    notifyListeners();
  }
}
