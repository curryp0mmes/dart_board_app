class DartGameData {
  int players;
  DartGameData(this.players);

  List<DartGamePlayer> playerData = [DartGamePlayer()];
  List<int> history = List<int>.empty(growable: true);

  int _currentPlayer = 0;
  int _currentDart = 0;

  DartGamePlayer getPlayerScore(int id) {
    if(id < playerData.length && id > 0) return playerData[id];
    return null;
  }


  void scorePoints(int amount, int multiplier) {
    int score = amount * multiplier;

    if(++_currentDart >= 3) {
      _currentDart = 0;
      if(++_currentPlayer >= players) {
        _currentPlayer = 0;
      }
    }
  }
}
class DartGamePlayer {
  int score = 501;

  List<int> threeDarts = [0,0,0];
  bool turn = false;

}