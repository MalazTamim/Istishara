// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/SearchingExpert.dart';
import 'InterestedExperts.dart';
// import 'backgroundExperts.dart';
import 'package:firebase_app/pages/user_controller.dart';
import 'package:auto_direction/auto_direction.dart';
import '../search/search.dart';
/*class PostingQuestion extends StatelessWidget {
  TextEditingController mycontroller = TextEditingController();
  UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    controller.getUser();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Asking a Question",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                controller: mycontroller,
                maxLines: 7,
                decoration: InputDecoration(
                  labelText: "Post Your Question",
                  labelStyle: TextStyle(
                    fontSize: 25,
                  ),
                  hintText: "Enter Your Question Here",
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black38,
                  ),
                  fillColor: Colors.grey[300],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 10),
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                height: 45,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    if (mycontroller.text.isBlank) {
                      //toast that tells him that his question is blank
                    } else {
                      controller.add_question(
                          question: mycontroller.text, category: Get.arguments);
                      Get.off(InterestedExperts(), arguments: Get.arguments);
                    }
                  },
                  child: Text(
                    'Post Your Question',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Want To Ask A Specific Expert?",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(SearchingExpert());
                  },
                  child: Text(
                    "Click Here!",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/
class PostingQuestion extends StatefulWidget {
  @override
  _PostingQuestionState createState() => _PostingQuestionState();
}

class _PostingQuestionState extends State<PostingQuestion> {
  TextEditingController mycontroller = TextEditingController();
  UserController controller = Get.put(UserController());
  String text = "";
  @override
  Widget build(BuildContext context) {
    controller.getUser();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Asking a Question",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: AutoDirection(
                text: text,
                child: TextField(
                    controller: mycontroller,
                    maxLines: 7,
                    decoration: InputDecoration(
                      labelText: "Post Your Question",
                      labelStyle: TextStyle(
                        fontSize: 25,
                      ),
                      hintText: "Enter Your Question Here",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black38,
                      ),
                      fillColor: Colors.grey[300],
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    onChanged: (str) {
                      setState(() {
                        text = str;
                      });
                    }),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 10),
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                height: 45,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    if (mycontroller.text.isBlank) {
                      //toast that tells him that his question is blank
                    } else {
                      controller.add_question(
                          question: mycontroller.text, category: Get.arguments);
                      Get.off(InterestedExperts(), arguments: Get.arguments);
                    }
                  },
                  child: Text(
                    'Post Your Question',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Want To Ask A Specific Expert?",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(Search());
                  },
                  child: Text(
                    "Click Here!",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}