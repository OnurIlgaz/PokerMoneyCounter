import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poker/game.dart';
import 'package:poker/get_names.dart';
import 'package:poker/providers/timer_provider.dart';

int kGlobalMoney = 1000;
int kIncreaseTime = 15;
double kMultiplication = 1.5;
int kPlayerCount = 8;
int kStartBlind = 6;
double kBlindMultiplication = 1.5;

void main() {
  runApp(
    Wrapper(
      child: const StartPage(),
    )  
  );
}

class Wrapper extends StatelessWidget {
  Wrapper({required this.child, super.key});
  Widget child;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          body: child,
        ),
      ),
    );
  }
}

class StartPage extends ConsumerWidget{
  const StartPage({super.key});

  void openGameOverlay(BuildContext context, WidgetRef ref) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => GetNames() ),
    );
    ref.read(timeProvider.notifier).startTimer();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const Game() ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: (){
              openGameOverlay(context, ref);
            },
            child: const Text('Start'),
          )
        ],
      ),
    );
  }
}