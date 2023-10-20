import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poker/main.dart';
import 'package:poker/providers/player_state.dart';

class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier() : super(GameState());

  void moveMade(Move move, WidgetRef ref, [int? bet]) {
    var moneyput = ref.read(playerStateProvider)[state.turn].moneyPut;
    var moneyrem = ref.read(playerStateProvider)[state.turn].moneyRemaining;
    if(move == Move.bet) {
      if(bet == null) {
        throw("you forgot to bet value");
      }
      print("huh?");
      state.betThisRound += bet;
      ref.read(playerStateProvider.notifier).updateInfo(
        index: state.turn,
        moneyPut: state.betThisRound,
        moneyRemaining: moneyrem - (state.betThisRound - moneyput),
      );
      print("checking");
    }
    if(move == Move.fold) {
      ref.read(playerStateProvider.notifier).updateInfo(
        index: state.turn,
        isFold: true,
      );
    }
    if(move == Move.check) {
      
    }
  }
}

final gameFlow = StateNotifierProvider<GameStateNotifier, GameState>((ref) => GameStateNotifier());

class GameState {
  int round = 1;
  int game = 1;
  int turn = 1;
  bool isRunning = true;
  int betThisRound = kStartBlind;
  int blindSpot = 1;
}

enum Move {
  bet,
  fold,
  check,  
}