class PlayerInfo {
  int moneyRemaining;
  int moneyPut;
  String? name;
  bool isFold;
  PlayerInfo({this.name, this.isFold = false, this.moneyPut = 0, required this.moneyRemaining});
}