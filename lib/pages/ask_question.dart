import 'package:firebase_app/pages/PostingQuestion.dart';
import '../grid/list_of_categories.dart';
import 'package:firebase_app/widgets/SearchingExpert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../search/search.dart';
class AskQuestion extends StatefulWidget {
  @override
  _AskQuestionState createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestion> {
  @override
  Widget build(BuildContext context) {
    //debugShowCheckedModeBanner: false,
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: SafeArea(
        child: ListView(children: <Widget>[
          Image.asset(
            "assets/ask.jpg",
            fit: BoxFit.contain,
            // height: 20,
            // width: 300,
          ),
          SizedBox(
              height: 20.0,
              width: 15.0,
              child: Divider(
                color: Colors.white,
              )),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 0.0, bottom: 18),
                child: Text(
                  "No Question Yet?",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 0.0, bottom: 28),
                child: Text(
                  "Ready to get thing done by talented experts? Get started now",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: FlatButton(
                  onPressed: () {
                    Get.off(PostingQuestion(),arguments: Get.arguments);
                  },
                  child: Text(
                    'POST A QUESTION',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                ),
              ),
              TextButton(
                child: Text(
                  "or Search for an expert",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Get.to(Search());
                },
              ),
            ],
          ),
        ]),
      ),

      //AppBar
      // body: _questionIndex < _questions.length
      //     ? Quiz(
      //         answerQuestion: _answerQuestion,
      //         questionIndex: _questionIndex,
      //         questions: _questions,
      //       )
      //     : Result(_totalScore, _resetQuiz),
    );
  }
}