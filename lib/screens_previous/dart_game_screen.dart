import 'package:dart_board_app/other_classes/dart_game.dart';
import 'package:dart_board_app/widgets/player_score_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DartGame extends StatefulWidget {
  @override
  _DartGameState createState() => _DartGameState();
}

class _DartGameState extends State<DartGame> {
  DartGameData dartGameData = DartGameData(2);

  List<Widget> _genButtons() {
    List<Container> list = List.empty(growable: true);
    for (int i = 1; i <= 20; i++) {
      list.add(
        Container(
          height: 80,
          child: OutlinedButton(
            child: Text(i.toString()),
            onPressed: () => _scorePoints(i),
            style: OutlinedButton.styleFrom(
              primary: Colors.black,
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              side: BorderSide(color: Theme.of(context).primaryColor),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
        ),
      );
    }
    return list;
  }

  void _scorePoints(int points) {
    if (points == 25 && singleDoubleTripleState == 2) return;
    setState(() {
      dartGameData.scorePoints(points, singleDoubleTripleState + 1);
      singleDoubleTripleState = 0;
    });
  }

  void _scoreTriplePoints(int points) {
    setState(() {
      dartGameData.scorePoints(points, 3);
      singleDoubleTripleState = 0;
    });
  }

  int singleDoubleTripleState = 0;
  void _setSingleDoubleTriple(int mode) {
    //
    setState(() {
      if (mode == singleDoubleTripleState)
        singleDoubleTripleState = 0;
      else if (mode >= 0 && mode <= 2) singleDoubleTripleState = mode;
    });
  }

  ButtonStyle _disabledSingleDoubleTriple = OutlinedButton.styleFrom(
    primary: Colors.red,
    textStyle: TextStyle(
      color: Colors.red,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    side: BorderSide(color: Colors.red),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
  );
  ButtonStyle _enabledSingleDoubleTriple = OutlinedButton.styleFrom(
    backgroundColor: Colors.red,
    primary: Colors.white,
    textStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    side: BorderSide(color: Colors.white),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
  );

  void _undoLastDart() {
    setState(() {
      dartGameData.undo();
    });
  }

  Column _buildGrid(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, int index) {
                return new PlayerScoreCard(dartGameData.getPlayerScore(index));
              }),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 80,
                            child: OutlinedButton(
                              child: Text("Single"),
                              onPressed: () => _setSingleDoubleTriple(0),
                              style: singleDoubleTripleState == 0
                                  ? _enabledSingleDoubleTriple
                                  : _disabledSingleDoubleTriple,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 80,
                            child: OutlinedButton(
                              child: Text("Double"),
                              onPressed: () => _setSingleDoubleTriple(1),
                              style: singleDoubleTripleState == 1
                                  ? _enabledSingleDoubleTriple
                                  : _disabledSingleDoubleTriple,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 80,
                            child: OutlinedButton(
                              child: Text("Triple"),
                              onPressed: () => _setSingleDoubleTriple(2),
                              style: singleDoubleTripleState == 2
                                  ? _enabledSingleDoubleTriple
                                  : _disabledSingleDoubleTriple,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _genButtons().getRange(0, 5).toList(),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _genButtons().getRange(5, 10).toList(),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _genButtons().getRange(10, 15).toList(),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _genButtons().getRange(15, 20).toList(),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 80,
                        child: OutlinedButton(
                          child: Text("UNDO"),
                          onPressed: () => _undoLastDart(),
                          style: OutlinedButton.styleFrom(
                            primary: Colors.black,
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        child: OutlinedButton(
                          child: Text("T19"),
                          onPressed: () => _scoreTriplePoints(19),
                          style: OutlinedButton.styleFrom(
                            primary: Colors.black,
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        child: OutlinedButton(
                          child: Text("T20"),
                          onPressed: () => _scoreTriplePoints(20),
                          style: OutlinedButton.styleFrom(
                            primary: Colors.black,
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        child: OutlinedButton(
                          child: Text("BULL"),
                          onPressed: () => _scorePoints(25),
                          style: OutlinedButton.styleFrom(
                            primary: Colors.black,
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        child: OutlinedButton(
                          child: Text("0"),
                          onPressed: () => _scorePoints(0),
                          style: OutlinedButton.styleFrom(
                            primary: Colors.black,
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Center(
          child: Text(
            "Darts",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () => _undoLastDart(),
        ),
        actions: [
          IconButton(icon: Icon(Icons.bar_chart), onPressed: () {}),
        ],
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Theme.of(context).primaryColor),
        backwardsCompatibility: false,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _buildGrid(context),
    );
  }
}
