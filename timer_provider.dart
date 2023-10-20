import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poker/main.dart';

class TimeState extends StateNotifier<Duration> {
  TimeState() : super(const Duration());

  void startTimer() async {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      state = state + const Duration(seconds: 1);
    });
  }

  double calculateEffect() {
    return pow(kBlindMultiplication, (state.inMinutes ~/ kIncreaseTime)).toDouble(); 
  }
}

final timeProvider = StateNotifierProvider<TimeState, Duration>((ref) => TimeState());