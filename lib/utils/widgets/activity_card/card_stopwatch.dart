import 'package:flutter/material.dart';
import 'dart:async';

class CardStopWatch extends ChangeNotifier {
  Stopwatch _stopwatch;
  String _timeDisplay;
  Timer _everySecond;
  bool isStarted;
  Color startColor;
  IconData startIcon;

  CardStopWatch() {
    _stopwatch = Stopwatch();
    _timeDisplay = '00:00:00';
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
    _timeDisplay = '00:00:00';
    notifyListeners();
  }

  void startingAction() {
    !isStarted ? _startTiming() : _stopTiming();
  }

  void _startTiming() {
    _setIconStatus();
    _stopwatch.start();
    isStarted = true;
    updateTime();
  }

  void _stopTiming() {
    _setIconStatus();
    _stopwatch.stop();
    _stopwatch.reset();
    isStarted = false;
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
