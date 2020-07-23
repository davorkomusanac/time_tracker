import 'package:flutter/material.dart';
import 'package:time_tracker/utils/widgets/activity_category_component.dart';
import 'dart:core';
import 'package:provider/provider.dart';
import 'package:time_tracker/utils/widgets/card_stopwatch.dart';

class ActivityCard extends StatefulWidget {
  final String categoryName;
  final IconData categoryIcon;

  ActivityCard({this.categoryName, this.categoryIcon});

  @override
  _ActivityCardState createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
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
                        Provider.of<CardStopWatch>(context).time,
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
                child: FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: () {
                    Provider.of<CardStopWatch>(context, listen: false)
                        .startingAction();
                  },
                  shape: CircleBorder(),
                  color: Provider.of<CardStopWatch>(context).startColor,
                  child: Container(
                    child: Icon(
                      Provider.of<CardStopWatch>(context).startIcon,
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
