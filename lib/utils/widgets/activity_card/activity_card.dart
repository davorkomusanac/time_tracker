import 'package:flutter/material.dart';
import 'package:time_tracker/logic/activities_history.dart';
import 'package:time_tracker/utils/constants.dart';
import 'package:time_tracker/utils/widgets/activity_card/activity_category_component.dart';
import 'dart:core';
import 'package:provider/provider.dart';
import 'package:time_tracker/logic/stopwatch.dart';
import 'package:time_tracker/utils/widgets/activity_tracker.dart';

class ActivityCard extends StatelessWidget {
  final String categoryName;
  final IconData categoryIcon;
  final Color categoryColor;

  const ActivityCard(
      {Key key,
      @required this.categoryName,
      @required this.categoryIcon,
      @required this.categoryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ActivityStopWatch>(
      builder: (context, stopWatch, child) {
        return SizedBox(
          child: Card(
            elevation: 5.0,
            color: kCardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ActivityCategory(
                        name: categoryName,
                        icon: categoryIcon,
                        color: categoryColor,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            stopWatch.time,
                            style: TextStyle(fontSize: 26.0),
                          ),
                          SizedBox(
                            width: 36.0,
                            child: FlatButton(
                              padding: EdgeInsets.all(0.0),
                              child: Icon(Icons.more_vert),
                              onPressed: () {
                                print('Edit activity button was pressed');
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 36.0,
                    child: FlatButton(
                      padding: EdgeInsets.all(0.0),
                      onPressed: () {
                        if (!stopWatch.isStarted) {
                          stopWatch.startTiming();
                        } else {
                          stopWatch.stopTiming();
                          Provider.of<ActivitiesHistory>(context, listen: false)
                              .addActivitySession(
                            ActivityTracker(
                              activity: ActivityCategory(
                                  name: categoryName,
                                  icon: categoryIcon,
                                  color: categoryColor),
                              startingTime: stopWatch.getStartingTime(),
                              endingTime: stopWatch.getEndingTime(),
                              length: stopWatch.getLength(),
                            ),
                          );
                        }
                        // stopWatch.startingAction();
                        // Provider.of<Activities>(context, listen: false)
                      },
                      shape: CircleBorder(),
                      color: stopWatch.startColor,
                      child: Container(
                        child: Icon(
                          stopWatch.startIcon,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
