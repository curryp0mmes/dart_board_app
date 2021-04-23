import 'package:dart_board_app/other_classes/dart_game.dart';
import 'package:flutter/material.dart';

class PlayerScoreCard extends StatefulWidget {
  DartGamePlayer dartGameData;
  PlayerScoreCard(this.dartGameData);
  @override
  _PlayerScoreCardState createState() => _PlayerScoreCardState(dartGameData);
}

class _PlayerScoreCardState extends State<PlayerScoreCard> {

  DartGamePlayer dartGameDataPlayer;

  _PlayerScoreCardState(this.dartGameDataPlayer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  dartGameDataPlayer.score.toString(),
                  style: TextStyle(fontSize: 50.0),
                ),
                Column(
                  children: [
                    Text(
                      "Jonas",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    Text("L: 0/3",
                        style:
                            TextStyle(color: Colors.grey, letterSpacing: 2.0)),
                    Text("S: 0/1",
                        style:
                            TextStyle(color: Colors.grey, letterSpacing: 2.0)),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 35.0,
                  child: Column(
                    children: [
                      Text("1",
                          style: TextStyle(
                              color: Colors.grey, letterSpacing: 2.0)),
                      Text(dartGameDataPlayer.threeDarts[0].toString(),
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                      Text("X"),
                    ],
                  ),
                ),
                Container(
                  width: 35.0,
                  child: Column(
                    children: [
                      Text("2",
                          style: TextStyle(
                              color: Colors.grey, letterSpacing: 2.0)),
                      Text(dartGameDataPlayer.threeDarts[1].toString(),
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                      Text("X"),
                    ],
                  ),
                ),
                Container(
                  width: 35.0,
                  child: Column(
                    children: [
                      Text("3",
                          style: TextStyle(
                              color: Colors.grey, letterSpacing: 2.0)),
                      Text(dartGameDataPlayer.threeDarts[2].toString(),
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                      Text("X"),
                    ],
                  ),
                ),
                Container(
                  width: 70.0,
                  child: Column(
                    children: [
                      Text("Total", style: TextStyle(color: Colors.grey)),
                      Text(dartGameDataPlayer.lastCombo.toString(),
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                      Text("AVG:100,0"),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        padding: EdgeInsets.all(10.0),
      ),
      elevation: 2.0,
    );
  }
}
