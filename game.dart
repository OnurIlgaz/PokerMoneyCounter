import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poker/game_flow.dart';
import 'package:poker/providers/game_time.dart';
import 'package:poker/main.dart';
import 'package:poker/pauser.dart';
import 'package:poker/providers/player_state.dart';
import 'package:poker/poker_table.dart';
import 'package:poker/table_UI.dart';
import 'package:poker/providers/timer_provider.dart';

class Game extends ConsumerWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var list = (ref.watch(playerStateProvider));
    int sum = 0;
    for(int i = 1; i <= kPlayerCount; i++) {
      sum += list[i].moneyPut;
    }
    return ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 71, 19, 19),
          body: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    const TableUI(),
                    const Column(
                      children: [
                        PokerTableWide(),
                      ],
                    ),
                    const Row(children: [
                      Pauser(),
                      Spacer(),
                      GameTime(),
                    ],),
                    Center(
                      child: Text(
                        '\$$sum',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )
                      ),
                    ), 
                  ],
                ),
              ),
              const Console(),
            ],
          ),
        ),
      ),
    );
  }
}

class BetOverlay extends ConsumerStatefulWidget {
  const BetOverlay({super.key});

  @override
  ConsumerState<BetOverlay> createState() => _BetOverlayState();
}

class _BetOverlayState extends ConsumerState<BetOverlay> {
  @override
  Widget build(BuildContext context) {
    double val = (kStartBlind.toDouble() * ref.watch(timeProvider.notifier).calculateEffect()).floorToDouble();

    return AlertDialog(
      title: const Text('Place your bet'),
      content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Select your bet amount:'),
        Slider(
          value: val,
          min: (kStartBlind.toDouble() * ref.watch(timeProvider.notifier).calculateEffect()).floorToDouble(),
          max: ref.read(playerStateProvider)[(ref.read(gameFlow).turn).toInt()].moneyRemaining.toDouble(),
          label: val.toString(),
          divisions: 2,
          onChanged: (double value) {
            setState((){
              val = value;
            });
          },
        ),
      ],
    ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(null);
          },
        ),
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop(val);
          },
        ),
      ],
    );
  }
}

class Console extends ConsumerWidget {
  const Console({super.key});

  Future<double?> openBetOverlay(BuildContext context) async {
    return showDialog<double>(
      context: context,
      builder: (BuildContext context) {
        return const BetOverlay();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: () async {
          final value = await openBetOverlay(context);
          if(value == null) {
            return;
          }
          ref.read(gameFlow.notifier).moveMade(Move.bet, ref, value.toInt());
        }, child: const Text('Bet')),
        ElevatedButton(onPressed: (){

        }, child: const Text('Check')),
        ElevatedButton(onPressed: (){

        }, child: const Text('Fold')),
      ],
    );
  }

}

