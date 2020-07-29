import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/screens/add_activity_screen.dart';
import 'package:time_tracker/screens/home_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:time_tracker/logic/activities.dart';
import 'package:time_tracker/logic/activities_history.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var activitiesHistory = ActivitiesHistory();
    var activities = Activities();
    return ChangeNotifierProvider.value(
      value: activitiesHistory,
      child: ChangeNotifierProvider.value(
        value: activities,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
              appBarTheme: AppBarTheme(
                color: Color(0xff663AB6),
              ),
            ),
            title: 'Time Tracker',
            home: HomeScreen(),
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case AddActivityScreen.id:
                  return PageTransition(
                      duration: Duration(milliseconds: 300),
                      child: AddActivityScreen(),
                      type: PageTransitionType.rightToLeft);
                default:
                  return null;
              }
            }),
      ),
    );
  }
}
