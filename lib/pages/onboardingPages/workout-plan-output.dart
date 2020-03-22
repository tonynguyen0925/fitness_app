import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:fitness_app/tabs/tabs.dart';
import 'package:fitness_app/services/shared-pref-helper.dart';
import 'package:fitness_app/databases/user-info-helper.dart';
import 'package:fitness_app/databases/user-info.dart';

class WorkoutPlanOutput extends StatefulWidget {
  @override
  _WorkoutPlanOutputState createState() => _WorkoutPlanOutputState();
}

class _WorkoutPlanOutputState extends State<WorkoutPlanOutput> {
  PageController controller;
  SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  void _init() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          plan(),
          nextButton(context),
        ],
      ),
    );
  }

  Widget plan() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Here is the best workout plan for you...',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget nextButton(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: AlignmentDirectional.bottomEnd,
        child: Container(
          margin: EdgeInsets.only(right: 16, bottom: 16),
          child: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            heroTag: 'nextButton',
            onPressed: () {
              SharedPreferencesHelper.setOnBoardingStatus(true, prefs);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Tabs()),
                (Route<dynamic> route) => false,
              );
            },
            shape: CircleBorder(),
            child: Icon(Icons.arrow_forward),
          ),
        ),
      ),
    );
  }
}
