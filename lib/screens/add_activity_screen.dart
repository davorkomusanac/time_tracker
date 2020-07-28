import 'package:flutter/material.dart';
import 'package:time_tracker/logic/activities.dart';
import 'package:time_tracker/utils/widgets/appbar/add_activity_appbar.dart';
import 'package:time_tracker/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/utils/widgets/color_picker.dart';
import 'package:time_tracker/utils/widgets/icon_picker.dart';

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
                activityIcon: activityIcon,
                activityColor: activityColor,
              );
              Navigator.pop(context);
            }
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: kAddActivityBoxDecoration,
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
                          decoration: kAddActivityInputDecoration,
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
                ChangeNotifierProvider(
                  create: (context) => IconPicker(context),
                  child: Padding(
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
                            child: Consumer<IconPicker>(
                              builder: (context, iconPicker, child) {
                                return InkWell(
                                  onTap: () => iconPicker.pickIcon(),
                                  child: Icon(
                                    activityIcon = iconPicker.getIconData,
                                    size: 36.0,
                                  ),
                                );
                              },
                            ),
                          ),
                        ]),
                  ),
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
