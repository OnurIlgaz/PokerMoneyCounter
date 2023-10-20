import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poker/player.dart';

class PokerTableWide extends ConsumerWidget {
  const PokerTableWide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Column(  
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,      
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const SizedBox(),
            Player(1),
            Player(2),
            const SizedBox(),
          ],),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Player(3),
            const SizedBox(),
            const SizedBox(),
            Player(4),
          ],),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Player(5),
            const SizedBox(),
            const SizedBox(),
            Player(6),
          ],),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const SizedBox(),
            Player(7),
            Player(8),
            const SizedBox(),
          ],)
        ],
      ),
    );
  }
}
