import 'Profile.dart';
import 'package:firebase_app/pages/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_app/pages/AnsweredQuestionsList.dart';

class editProfile extends StatefulWidget {
  @override
  _editProfileState createState() => _editProfileState();
}

void goto() {
 
 Get.off(Profile()) ; 


}

class _editProfileState extends State<editProfile> {
  
  String about ;
  String skill1 ; 
  String skill2 ; 
  String skill3 ; 
  String skill4 ; 
  String skill5 ; 
  String skill6 ; 

  UserController controller = Get.put(UserController());

  
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                initialValue: controller.myUser.value.about,
                onChanged: (newText) {about = newText ; },
                maxLines: 5,
                decoration: InputDecoration(
                    labelText: "About",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
              child: TextFormField(
                initialValue: controller.myUser.value.skill1,
                onChanged: (newText) {skill1 = newText ; },
                decoration: InputDecoration(
                    labelText: "Skill 1",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextFormField(
                
                initialValue: controller.myUser.value.skill2,
                onChanged: (newText) {skill2 = newText ; },
                decoration: InputDecoration(
                    labelText: "Skill 2",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextFormField(
                initialValue: controller.myUser.value.skill3,
                onChanged: (newText) {skill3 = newText ; },
                decoration: InputDecoration(
                    labelText: "Skill 3",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextFormField(
                initialValue: controller.myUser.value.skill4,
                onChanged: (newText) {skill4 = newText ; },
                decoration: InputDecoration(
                    labelText: "Skill 4",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextFormField(
                initialValue: controller.myUser.value.skill5,
                onChanged: (newText) {skill5 = newText ; },
                decoration: InputDecoration(
                    labelText: "Skill 5",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextFormField(
                initialValue: controller.myUser.value.skill6,
               onChanged: (newText) {skill6 = newText ; },
                decoration: InputDecoration(
                    labelText: "Skill 6",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue,
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(200, 10, 10, 40),
              child: FlatButton(
                onPressed: () async {
                  if(about=="") { about=controller.myUser.value.about ; }
                  print("this isssssssssssssss  $about")  ; 
                 await controller.setProfile(about,skill1,skill2,skill3,skill4,skill5,skill6) ; 
                  goto();
                },
                color: Colors.blue,
                child: Text(
                  "Save Changes",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}