import 'package:flutter/material.dart';
import 'package:time_tracker/utils/constants.dart';
import 'package:time_tracker/utils/widgets/activity_card/activity_category_component.dart';
import 'dart:core';
import 'package:provider/provider.dart';
import 'package:time_tracker/logic/stopwatch.dart';

class ActivityCard extends StatelessWidget {
  final String categoryName;
  final IconData categoryIcon;
  final Color categoryColor;

  ActivityCard(
      {@required this.categoryName,
      @required this.categoryIcon,
      @required this.categoryColor});

  @override
  Widget build(BuildContext context) {
    return Consumer<CardStopWatch>(
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
                          FlatButton(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(Icons.menu),
                            onPressed: () {
                              print('Edit activity button was pressed');
                            },
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
                        stopWatch.startingAction();
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
