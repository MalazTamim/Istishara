import 'package:flutter/material.dart';
import 'ExpertList.dart';
import 'package:get/get.dart';
import '../models/ListExperts.dart';

class backgroundExperts extends StatefulWidget {
  @override
  _backgroundExpertsState createState() => _backgroundExpertsState();
}

class _backgroundExpertsState extends State<backgroundExperts> {
  @override
  Widget build(BuildContext context) {
    final txListWidget = Container(
        height: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top) *
            0.9,
        child: ExpertList(expertsList, expertListIcons));

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(9),
              child: Text("Interested Experts",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
          ),
          txListWidget,
        ],
      ),
    ));
  }
}
