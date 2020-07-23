import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:time_tracker/utils/widgets/activity_category.dart';
import 'dart:core';

class ActivityCard extends StatefulWidget {
  final String categoryName;
  final IconData categoryIcon;

  ActivityCard({this.categoryName, this.categoryIcon});

  @override
  _ActivityCardState createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  Stopwatch stopwatch = Stopwatch();
  bool isStarted = false;
  String timeDisplay = '00:00:00';
  Timer _everySecond;
  Color startColor = Colors.green;
  IconData startIcon = Icons.play_arrow;

  void updateTime() {
    if (isStarted) {
      setState(() {
        timeDisplay = stopwatch.elapsed.inHours.toString().padLeft(2, '0') +
            ':' +
            (stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
            ':' +
            (stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');
      });
    }
  }

  void resetTime() {
    timeDisplay = '00:00:00';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 5.0,
        color: Color(0xFFe0e0e0),
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
                      name: widget.categoryName, icon: widget.categoryIcon),
                  Row(
                    children: <Widget>[
                      Text(
                        timeDisplay,
                        style: TextStyle(fontSize: 22.0),
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(Icons.menu),
                        onPressed: () {
                          print('HELLO');
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 36.0,
                //height: 36.0,
                child: FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: () {
                    setState(() {
                      if (!isStarted) {
                        startColor = Colors.red;
                        startIcon = Icons.stop;
                        stopwatch.start();
                        isStarted = true;
                        _everySecond =
                            Timer.periodic(Duration(seconds: 1), (timer) {
                          updateTime();
                        });
                      } else {
                        startColor = Colors.green;
                        startIcon = Icons.play_arrow;
                        stopwatch.stop();
                        stopwatch.reset();
                        isStarted = false;
                        _everySecond.cancel();
                        resetTime();
                      }
                    });
                  },
                  shape: CircleBorder(),
                  color: startColor,
                  child: Container(
                    child: Icon(
                      startIcon,
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
  }
}
