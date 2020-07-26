import 'package:flutter/material.dart';
import 'dart:async';

class ActivityStopWatch extends ChangeNotifier {
  Stopwatch _stopwatch;
  String _timeDisplay;
  Timer _everySecond;
  bool isStarted;
  Color startColor;
  IconData startIcon;

  ActivityStopWatch() {
    _stopwatch = Stopwatch();
    _timeDisplay = '';
    isStarted = false;
    startColor = Colors.green;
    startIcon = Icons.play_arrow;
  }

  void updateTime() {
    _everySecond = Timer.periodic(Duration(seconds: 1), (timer) {
      _timeDisplay = _stopwatch.elapsed.inHours.toString().padLeft(2, '0') +
          ':' +
          (_stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
          ':' +
          (_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');
      notifyListeners();
    });
  }

  void resetTime() {
    _timeDisplay = '';
    notifyListeners();
  }

  void startingAction() {
    !isStarted ? _startTiming() : _stopTiming();
  }

  void _startTiming() {
    _timeDisplay = '00:00:00';
    _setIconStatus();
    isStarted = true;
    _stopwatch.start();
    updateTime();
  }

  void _stopTiming() {
    _setIconStatus();
    isStarted = false;
    _stopwatch.stop();
    _stopwatch.reset();
    _everySecond.cancel();
    resetTime();
  }

  void _setIconStatus() {
    if (!isStarted) {
      startColor = Colors.red;
      startIcon = Icons.stop;
    } else {
      startColor = Colors.green;
      startIcon = Icons.play_arrow;
    }
    notifyListeners();
  }

  String get time {
    return _timeDisplay;
  }
}
