import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:poker/main.dart';
import 'package:poker/providers/timer_provider.dart';

class GameTime extends ConsumerWidget {
  const GameTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Duration time = ref.watch(timeProvider);
    int minutes = time.inMinutes % kIncreaseTime;
    int seconds = time.inSeconds % 60;
    double size = MediaQuery.of(context).size.shortestSide;
    int goodSpace = (size ~/ 100) - 1;
    return Padding(
      padding: EdgeInsets.all(goodSpace.toDouble() * 1.5),
      child: Card(
        color: Colors.green[900],
        shadowColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(goodSpace.toDouble()),
          child: Card(
            shadowColor: Colors.white,
            color: const Color.fromARGB(255, 109, 61, 7),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: goodSpace.toDouble() * 1.5, horizontal: goodSpace.toDouble() * 1.5 * 2),
              child: Text(
                "${kIncreaseTime - minutes - (seconds == 0 ? 0 : 1) < 10 ? '0' : ''}${kIncreaseTime - minutes - (seconds == 0 ? 0 : 1)} : ${(0 - seconds) % 60 < 10 ? '0' : ''}${(0 - seconds) % 60}", 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: goodSpace * 4,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}