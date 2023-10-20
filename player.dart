import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poker/game_flow.dart';
import 'package:poker/providers/player_state.dart';

class Player extends ConsumerWidget {
  const Player(this.no, {super.key});
  final int no;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double size = MediaQuery.of(context).size.shortestSide;
    int goodSpace = (size ~/ 100) - 1;
    var info = (ref.watch(playerStateProvider))[no];
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(goodSpace.toDouble() * 10),
            ),
            color: no == ref.watch(gameFlow).turn ? Colors.amber : const Color.fromARGB(255, 60, 72, 236),
            child: SizedBox(height: goodSpace.toDouble() * 20, width: goodSpace.toDouble() * 20, child: Center(child: Text(
              info.name!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 3 * goodSpace.toDouble(),
              ),
            )),),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(goodSpace.toDouble() * 10),
          ),
          color:const Color.fromARGB(255, 87, 15, 80),
          child: SizedBox(height: goodSpace.toDouble() * 5, width: goodSpace.toDouble() * 20, child: Center(child: Text(
            "\$${info.moneyRemaining}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 3 * goodSpace.toDouble(),
            ),
          )),),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(goodSpace.toDouble() * 10),
            ),
            color: const Color.fromARGB(255, 87, 61, 85),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "\$${info.moneyPut}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 3 * goodSpace.toDouble(),
                ),
              ),
            ),
          ),
        )
      ]
    );
  }

}