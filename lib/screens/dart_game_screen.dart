import 'package:dart_board_app/widgets/player_score_widget.dart';
import 'package:flutter/material.dart';

class DartGame extends StatefulWidget {
  @override
  _DartGameState createState() => _DartGameState();
}

class _DartGameState extends State<DartGame> {
  List<int> numbers = [1];


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
    setState(() {
      numbers.add(points);
    });
  }
  int singleDoubleTripleState = 0;
  void _setSingleDoubleTriple(int mode) { //
    setState(() {
      if (mode == singleDoubleTripleState) singleDoubleTripleState = 0;
      else if(mode >= 0 && mode <= 2)
      singleDoubleTripleState = mode;
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
    borderRadius:
    BorderRadius.all(Radius.circular(10))),
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
        borderRadius:
        BorderRadius.all(Radius.circular(10))),
  );

  void _undoLastDart() {
    setState(() {
      if (numbers.length > 0) numbers.removeLast();
    });
  }

  Column _buildGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            children: [
              PlayerScoreCard.numbers(numbers),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                    (numbers.length != 0 ? numbers.last.toString() : "0") +
                        " length: " +
                        numbers.length.toString()),
              ),
            ],
          ),
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
                              style: singleDoubleTripleState == 0 ? _enabledSingleDoubleTriple : _disabledSingleDoubleTriple,
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
                              style: singleDoubleTripleState == 1 ? _enabledSingleDoubleTriple : _disabledSingleDoubleTriple,
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
                              style: singleDoubleTripleState == 2 ? _enabledSingleDoubleTriple : _disabledSingleDoubleTriple,
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
      ),
      body: _buildGrid(),
    );
  }
}
