import 'package:flutter/material.dart';
import 'package:time_tracker/utils/constants.dart';
import 'package:time_tracker/utils/widgets/activity_card/activity_category_component.dart';
import 'dart:core';
import 'package:provider/provider.dart';
import 'package:time_tracker/utils/widgets/activity_card/card_stopwatch.dart';

class ActivityCard extends StatelessWidget {
  final String categoryName;
  final IconData categoryIcon;

  ActivityCard({this.categoryName, this.categoryIcon});

  @override
  Widget build(BuildContext context) {
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
                  ActivityCategory(name: categoryName, icon: categoryIcon),
                  Row(
                    children: <Widget>[
                      Text(
                        Provider.of<CardStopWatch>(context).time,
                        style: TextStyle(fontSize: 26.0),
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
