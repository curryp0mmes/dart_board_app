class DartGameData {
  int players = 1;
  DartGameData(this.players);

  List<DartGamePlayer> playerData = [DartGamePlayer(),DartGamePlayer()];
  List<int> history = List<int>.empty(growable: true);

  int _currentPlayer = 0;
  int _currentDart = 0;

  DartGamePlayer getPlayerScore(int id) {
    if(id < playerData.length && id >= 0) return playerData[id];
    return null;
  }


  void scorePoints(int amount, int multiplier) {
    int scored = amount * multiplier;

    if(_currentDart == 0) {
      playerData[_currentPlayer].lastCombo = 0;
      playerData[_currentPlayer].threeDarts = [0,0,0];
    }


    history.add(scored);
    playerData[_currentPlayer].threeDarts[_currentDart] = scored;
    playerData[_currentPlayer].score -= scored;




    _currentDart++;
    if(_currentDart >= 3) {
      _currentDart = 0;
      playerData[_currentPlayer].updateCombo();

      _currentPlayer++;
      if(_currentPlayer >= players) {
        _currentPlayer = 0;
      }
    }

  }

  void undo() {
    if(history.length <= 0) return;
    _currentDart--;
    if(_currentDart < 0) {
      _currentDart = 2;
      _currentPlayer--;
      if(_currentPlayer < 0) _currentPlayer = players-1;
    }

    playerData[_currentPlayer].threeDarts[_currentDart] = 0;
    playerData[_currentPlayer].score += history.removeLast();

  }
}
class DartGamePlayer {
  int score = 501;
  int lastCombo = 0;
  List<int> threeDarts = [0,0,0];
  bool turn = false;

  void updateCombo() {
    lastCombo = threeDarts[0]+threeDarts[1]+threeDarts[2];
  }
}