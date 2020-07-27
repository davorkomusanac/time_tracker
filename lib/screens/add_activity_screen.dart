import 'package:flutter/material.dart';
import 'package:time_tracker/logic/activities.dart';
import 'package:time_tracker/utils/widgets/appbar/add_activity_appbar.dart';
import 'package:time_tracker/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/utils/widgets/color_picker.dart';

class AddActivityScreen extends StatelessWidget {
  static const String id = 'add_activity_screen';

  @override
  Widget build(BuildContext context) {
    String newActivityTitle;
    IconData activityIcon;
    Color activityColor;

    return Scaffold(
        appBar: AddActivityScreenBar(
          onSaveCallback: () {
            if (newActivityTitle != null && newActivityTitle.isNotEmpty) {
              Provider.of<Activities>(context, listen: false).addActivity(
                activityName: newActivityTitle.trim(),
                activityIcon: Icons.access_time,
                activityColor: activityColor,
              );
              Navigator.pop(context);
            }
          },
        ),
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
                              horizontal: 30.0,
                              vertical: 5.0,
                            ),
                          ),
                          style: kAddActivityTextStyle,
                          textAlign: TextAlign.center,
                          onChanged: (newText) {
                            newActivityTitle = newText;
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () => print('icon button'),
                            child: Icon(
                              Icons.access_time,
                              size: 36.0,
                            ),
                          ),
                        ),
                      ]),
                ),
                ChangeNotifierProvider(
                  create: (context) => ColorPicker(context),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Color',
                          style: kAddActivityTextStyle,
                        ),
                        Consumer<ColorPicker>(
                          builder: (context, colorPicker, child) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 36.0,
                                child: FlatButton(
                                  child: null,
                                  padding: EdgeInsets.all(0.0),
                                  onPressed: () {
                                    colorPicker.openMainColorPicker();
                                  },
                                  shape: CircleBorder(),
                                  color: activityColor = colorPicker.getColor(),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
