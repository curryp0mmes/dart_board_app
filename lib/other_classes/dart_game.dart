import 'package:flutter/material.dart';

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
    playerData[_currentPlayer].history.add(scored);
    playerData[_currentPlayer].threeDarts[_currentDart] = scored;
    playerData[_currentPlayer].score -= scored;

    if(playerData[_currentPlayer].score == 0 && multiplier == 2) {
      //done with leg
    }
    else if(playerData[_currentPlayer].score <= 1) {
       playerData[_currentPlayer].snackBar = SnackBar(content: Text('You scored too much'));

    }

    playerData[_currentPlayer].updateAverage();


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
    playerData[_currentPlayer].history.removeLast();
  }
}
class DartGamePlayer {
  int score = 501;
  int lastCombo = 0;
  List<int> threeDarts = [0,0,0];
  bool turn = false;
  List<int> history = List<int>.empty(growable: true);
  dynamic average = 0;
  String averageString = "0";
  SnackBar snackBar;

  void updateCombo() {
    lastCombo = threeDarts[0]+threeDarts[1]+threeDarts[2];
  }
  void updateAverage() {
    if(history.length <= 0) average = 0;
    else {
      int sum = 0;
      for(int scorePiece in history) {
        sum += scorePiece;
      }
      average = (sum / history.length * 3).toDouble();
      if(average.round().toDouble() == average) averageString = average.toStringAsFixed(0);
      else if(average >= 100) averageString = average.toStringAsFixed(1);
      else averageString = average.toStringAsFixed(2);


    }
  }
}