import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    MediaQuery.of(context).
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Container(
          width: screenWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0)
              ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 40.0),
            child: Column(
              children: [
                Expanded(
                  child: TextButton(
                      onPressed: () => {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                  ),
                ),
                Expanded(
                  child: TextButton(
                      onPressed: ()=> {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                  ),
                ),
                Expanded(
                  child: TextButton(
                      onPressed: ()=> {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                  ),
                ),
                Expanded(
                  child: TextButton(
                      onPressed: ()=> {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  SliverToBoxAdapter _buildHeader() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
            )
        ),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
