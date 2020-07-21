import 'package:flutter/material.dart';
import 'package:time_tracker/utils/widgets/activity_category.dart';

class ActivityCard extends StatelessWidget {
  String categoryName;
  IconData categoryIcon;

  ActivityCard({this.categoryName, this.categoryIcon});

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
                  ActivityCategory(name: categoryName, icon: categoryIcon),
                  FlatButton(
                    padding: EdgeInsets.all(0.0),
                    child: Icon(Icons.menu),
                    onPressed: () {
                      print('HELLO');
                    },
                  ),
                ],
              ),
              SizedBox(
                width: 36.0,
                //height: 36.0,
                child: FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: () {
                    print('WORLD');
                  },
                  shape: CircleBorder(),
                  color: Colors.green,
                  child: Container(
                    child: Icon(Icons.play_arrow),
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
