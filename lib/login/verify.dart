// import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../profile/Profile.dart';
// import 'package:firebase_app/models/client.dart';
// import 'package:firebase_app/models/expert.dart';
// import 'package:firebase_app/pages/categories_build.dart';
import '../grid/list_of_categories.dart';
import 'package:firebase_app/pages/navigationExpert.dart';
import 'sign_up.dart';
// import 'package:firebase_app/pages/testpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_app/authenticationProvider.dart';
import 'dart:async';
import 'package:get/get.dart';

import '../pages/navigationClient.dart';
// import 'ask_question.dart';

class Verify extends StatefulWidget {
  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  Timer timer;
  User user;
  final auth = FirebaseAuth.instance;
  Map data;

  @override
  void initState() {
    super.initState();
    user = auth.currentUser;
    // Provider.of<AuthenticationProvider>(context).firebaseAuth.currentUser.sendEmailVerification();
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: AlertDialog(
          // backgroundColor: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          Image.asset(
              "assets/images/email.png",
              fit: BoxFit.contain,
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // height: 300,
              // width: 200,
            ),
            SizedBox(height:22),
           SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
               

             Center(
               child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "Email Confirmation",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.blue
                ),
            ),
          ),
             ),
                
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'An email has been sent to ${user.email}. ',
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 19
                      ),
                    ),
                  ),
                
                SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [ Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Please verify your email',
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ' Wait in this page untill we direct you.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18
                      ),
                    ),
                  ),
                  ],)
                ),

                

              ],
            ),
          ),

          ],)
           
          // actions: <Widget>[
          //   TextButton(
          //     child: Text('Ok'),
          //     onPressed: () {
          //       Get.back();
          //     },
          //   ),
          // ],
        // ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;

    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Map data = Get.arguments;
      String field1;
      if (data["field"] == "Architect") field1 = "architect";
      if (data["field"] == "Civil Engineer") field1 = "civil";
      if (data["field"] == "Construction Engineer") field1 = "construction";
      if (data["field"] == "Doctor") field1 = "doctor";
      if (data["field"] == "Electrical Engineer") field1 = "electrical";
      if (data["field"] == "Family practitioner") field1 = "family";
      if (data["field"] == "Heating & cooling Engineer") field1 = "heating";
      if (data["field"] == "Mechanical Enginner") field1 = "mechanical";
      if (data["field"] == "Psychologist") field1 = "psych";

      if (data["isexpert"]) {
        // Expert expert = Expert(name: data["name"], email: data["email"], phonenumber: data["phoneNumber"],field: data["field"]) ;
        FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          "name": data["name"],
          "email": data["email"],
          "phoneNumber": data["phoneNumber"],
          "field": field1,
          "type": "expert",
          "uid": FirebaseAuth.instance.currentUser.uid,
          
          "chatPeople" : [],
          "imageURL" : data["imageURL"],
          "about" : "",
           "skill1" : "",
          "skill2": "",
          "skill3": "",
          "skill4": "",
          "skill5": "",
          "skill6": "",
          "rating":0.1,

        });
        Get.off(navigationExpert());
      } else {
        // Client client = Client(name: data["name"], email: data["email"], phonenumber: data["phoneNumber"]) ;
        FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          "name": data["name"],
          "email": data["email"],
          "phoneNumber": data["phoneNumber"],
          "type": "client",
          "architect": "",
          "civil": "",
          "construction": "",
          "doctor": "",
          "electrical": "",
          "family": "",
          "heating": "",
          "mechanical": "",
          "psych": "",
          "uid": FirebaseAuth.instance.currentUser.uid,
          "interestedArchitect": [],
          "interestedCivil": [],
          "interestedConstruction": [],
          "interestedDoctor": [],
          "interestedElectrical": [],
          "interestedFamily": [],
          "interestedHeating": [],
          "interestedMechanical": [],
          "interestedPsych": [],

          "chatPeople" : [],
          "imageURL" : data["imageURL"],
         
        });
        Get.off(navigationClient());
      }
    }
  }
}