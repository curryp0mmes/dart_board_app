import 'package:flutter/material.dart';

class PlayerScoreCard extends StatefulWidget {
  @override
  _PlayerScoreCardState createState() => _PlayerScoreCardState();
}

class _PlayerScoreCardState extends State<PlayerScoreCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        child: Column(
          children: [
            Row(
              children: [
                Text("501",style: TextStyle(fontSize: 50.0),),
                Column(
                  children: [
                    Text("Jonas",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                    Text("L: 0/3",style: TextStyle(color: Colors.grey, letterSpacing: 2.0)),
                    Text("S: 0/1",style: TextStyle(color: Colors.grey, letterSpacing: 2.0)),
                  ],
                )
              ],
            ),



          ],
        ),
        padding: EdgeInsets.all(10.0),
      ),
      elevation: 2.0,
    );
  }
}
