import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poker/main.dart';
import 'package:poker/player_info.dart';

class PlayerState extends StateNotifier<List<PlayerInfo>> {
  PlayerState() : super([]);

  void updateInfo({required int index, String? name, int? moneyPut, int? moneyRemaining, bool? isFold}) {
    name ??= state[index].name;
    moneyPut ??= state[index].moneyPut;
    moneyRemaining ??= state[index].moneyRemaining;
    isFold ??= state[index].isFold;
    print("in");
    state = [
      ...state.sublist(0, index - 1),
      PlayerInfo(name: name, moneyPut: moneyPut, moneyRemaining: moneyRemaining,
        isFold: isFold,
      ),
      ...state.sublist(index + 1),
    ];
  }

  void init(List<String> stringNames) {
    state = [
      ...stringNames.map((e) => PlayerInfo(name: e, moneyRemaining: kGlobalMoney))
    ];
  }
}

final playerStateProvider = StateNotifierProvider<PlayerState, List<PlayerInfo>>((ref) => PlayerState());