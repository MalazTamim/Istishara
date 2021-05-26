import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_app/pages/user_controller.dart';

final List<String> categoriesListIcons = [
  "assets/images/icons/architect.png",
  "assets/images/icons/civil.png",
  "assets/images/icons/construction.png",
  "assets/images/icons/doctor.png",
  "assets/images/icons/electrical.png",
  "assets/images/icons/family.png",
  "assets/images/icons/heating.png",
  "assets/images/icons/mechanical.png",
  "assets/images/icons/psychologist.png",
];

class AllQuestions extends StatelessWidget {
  UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    var c = controller.myUser.value;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Questions"),
      ),
      body: ListView(
        children: [
          c.architect == ""
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 15),
                            Container(
                              height: 40,
                              width: 40,
                              child: Image.asset(
                                  "assets/images/icons/architect.png"),
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Architect",
                              style: TextStyle(
                                  color: Colors.blue,
                                  //backgroundColor: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${c.architect}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
          c.civil == ""
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 15),
                            Container(
                              height: 40,
                              width: 40,
                              child:
                                  Image.asset("assets/images/icons/civil.png"),
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Civil Engineer",
                              style: TextStyle(
                                  color: Colors.blue,
                                  //backgroundColor: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${c.civil}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
          c.construction == ""
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 15),
                            Container(
                              height: 40,
                              width: 40,
                              child: Image.asset(
                                  "assets/images/icons/construction.png"),
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Construction Engineer",
                              style: TextStyle(
                                  color: Colors.blue,
                                  //backgroundColor: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${c.construction}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
          c.electrical == ""
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 15),
                            Container(
                              height: 40,
                              width: 40,
                              child: Image.asset(
                                  "assets/images/icons/electrical.png"),
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Electrical Engineer",
                              style: TextStyle(
                                  color: Colors.blue,
                                  //backgroundColor: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${c.electrical}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
          c.family == ""
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 15),
                            Container(
                              height: 40,
                              width: 40,
                              child:
                                  Image.asset("assets/images/icons/family.png"),
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Family Practitioner",
                              style: TextStyle(
                                  color: Colors.blue,
                                  //backgroundColor: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${c.family}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
          c.heating == ""
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 15),
                            Container(
                              height: 40,
                              width: 40,
                              child: Image.asset(
                                  "assets/images/icons/heating.png"),
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Heating and Cooling",
                              style: TextStyle(
                                  color: Colors.blue,
                                  //backgroundColor: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${c.heating}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
          c.mechanical == ""
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 15),
                            Container(
                              height: 40,
                              width: 40,
                              child: Image.asset(
                                  "assets/images/icons/mechanical.png"),
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Mechanical Engineer",
                              style: TextStyle(
                                  color: Colors.blue,
                                  //backgroundColor: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${c.mechanical}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
          c.psych == ""
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 15),
                            Container(
                              height: 40,
                              width: 40,
                              child: Image.asset(
                                  "assets/images/icons/psychologist.png"),
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Psychologist",
                              style: TextStyle(
                                  color: Colors.blue,
                                  //backgroundColor: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${c.psych}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
          c.doctor == ""
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 15),
                            Container(
                              height: 40,
                              width: 40,
                              child:
                                  Image.asset("assets/images/icons/doctor.png"),
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Doctor",
                              style: TextStyle(
                                  color: Colors.blue,
                                  //backgroundColor: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          child: Text(
                            "${c.doctor}",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}