import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
                  child: Text(
                    'A FEW QUESTIONS BEFORE WE GET STARTED',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 500,
                ),
                ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/second',
                      );
                    },
                    child: Text('GET STARTED'),
                    shape: RoundedRectangleBorder(),
                    color: Colors.lightBlueAccent, //TODO: Pick a Color
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
