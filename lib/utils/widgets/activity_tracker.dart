import 'package:time_tracker/utils/widgets/activity_card/activity_category_component.dart';
import 'package:flutter/material.dart';

class ActivityTracker {
  ActivityCategory activity;
  DateTime startingTime;
  DateTime endingTime;
  String length;

  ActivityTracker(
      {@required this.activity,
      @required this.startingTime,
      @required this.endingTime,
      @required this.length});

  Widget get activityName {
    return activity;
  }

  String get timeStarted {
    return ('${startingTime.hour}:${startingTime.minute}');
  }

  String get timeFinished {
    return ('${endingTime.hour}:${endingTime.minute}');
  }

  String get timePeriod {
    return ('${startingTime.hour.toString().padLeft(2, '0')}:${startingTime.minute.toString().padLeft(2, '0')} - ${endingTime.hour.toString().padLeft(2, '0')}:${endingTime.minute.toString().padLeft(2, '0')}');
  }

  String get timeSpent {
    return length;
  }
}
