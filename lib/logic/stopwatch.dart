import 'package:flutter/material.dart';
import 'dart:async';

class ActivityStopWatch extends ChangeNotifier {
  Stopwatch _stopwatch;
  String _timeDisplay;
  Timer _everySecond;
  bool isStarted;
  Color startColor;
  IconData startIcon;
  DateTime startingTime;
  DateTime endingTime;
  String length;

  ActivityStopWatch() {
    _stopwatch = Stopwatch();
    _timeDisplay = '';
    isStarted = false;
    startColor = Colors.green;
    startIcon = Icons.play_arrow;
  }

  void updateTime() {
    startingTime = DateTime.now();
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
    endingTime = DateTime.now();
    _timeDisplay = '';
    notifyListeners();
  }

  void startingAction() {
    !isStarted ? startTiming() : stopTiming();
  }

  void startTiming() {
    _timeDisplay = '00:00:00';
    _setIconStatus();
    isStarted = true;
    _stopwatch.start();
    updateTime();
  }

  void stopTiming() {
    _setIconStatus();
    isStarted = false;
    _stopwatch.stop();
    setLength();
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

  void setLength() {
    if (_stopwatch.elapsed.inSeconds < 60) {
      length = '${_stopwatch.elapsed.inSeconds}s';
    } else if (_stopwatch.elapsed.inMinutes < 60) {
      length = '${_stopwatch.elapsed.inMinutes}m';
    } else {
      length =
          '${_stopwatch.elapsed.inHours}h${(_stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, '0')}m';
    }
  }

  String get time {
    return _timeDisplay;
  }

  String getLength() {
    return length;
  }

  DateTime getStartingTime() {
    return startingTime;
  }

  DateTime getEndingTime() {
    return endingTime;
  }
}
