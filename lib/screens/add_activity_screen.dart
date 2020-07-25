import 'package:flutter/material.dart';
import 'package:time_tracker/utils/widgets/appbar/add_activity_appbar.dart';
import 'package:time_tracker/utils/constants.dart';

class AddActivityScreen extends StatelessWidget {
  static const String id = 'add_activity_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: addActivityScreenBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: kCardColor,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(blurRadius: 4.0),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Activity Name',
                          style: kAddActivityTextStyle,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 5.0),
                          ),
                          style: kAddActivityTextStyle,
                          textAlign: TextAlign.center,
                          onChanged: (newText) {
                            print(newText);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Icon',
                        style: kAddActivityTextStyle,
                      ),
                      IconButton(
                          icon: Icon(Icons.access_time),
                          onPressed: () {
                            print('hello Time');
                          })
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Color',
                        style: kAddActivityTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 36.0,
                          child: FlatButton(
                            child: null,
                            padding: EdgeInsets.all(0.0),
                            onPressed: () {
                              print('Pressed');
                            },
                            shape: CircleBorder(),
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
