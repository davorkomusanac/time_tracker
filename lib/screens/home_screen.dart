import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/utils/widgets/activity_card/activity_card.dart';
import 'package:time_tracker/utils/widgets/appbar/home_screen_appbar.dart';
import 'package:time_tracker/utils/widgets/activity_card/card_stopwatch.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  final List<Widget> tabBodyText = [
    Text('FIRST'),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ChangeNotifierProvider(
              create: (context) => CardStopWatch(),
              child: ActivityCard(
                  categoryName: 'Sleep', categoryIcon: Icons.hotel),
            ),
          ),
        ],
      ),
    ),
    Text('THIRD'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: homeScreenAppBar(context),
        body: TabBarView(children: tabBodyText),
      ),
    );
  }
}
