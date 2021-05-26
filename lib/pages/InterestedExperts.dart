import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/grid/list_of_categories.dart';
import 'package:firebase_app/pages/navigationClient.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/pages/user_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
 
class InterestedExperts extends StatefulWidget {
  @override
  _InterestedExpertsState createState() => _InterestedExpertsState();
}

class _InterestedExpertsState extends State<InterestedExperts> {
  UserController controller = Get.put(UserController());



  bool alreadypicked(String name) 
  {
    List l = controller.myUser.value.chatPeople ; 
    for(int i = 0 ; i<controller.myUser.value.chatPeople.length ; i++) 
    {
      if(l[i]==name) return true ; 
    }
    return false ; 
  }

  void pick(String name) async
  {
    controller.myUser.value.chatPeople.add(name) ; 
    FirebaseFirestore.instance.collection("users").doc(controller.myUser.value.uid).update(
      {
        "chatPeople" : controller.myUser.value.chatPeople 
      }
    ); 
    var f  = await FirebaseFirestore.instance.collection("users").limit(1).where("name", isEqualTo: name).get();
    var f1 = f.docs.first.id ; 
    var expert = await FirebaseFirestore.instance.collection("users").doc(f1).get() ; 
    List l1 = expert.data()["chatPeople"] ; 
    l1.add(controller.myUser.value.name) ; 
    FirebaseFirestore.instance.collection("users").doc(f1).update(
      {
          "chatPeople" : l1 
      }
      ); 
      Fluttertoast.showToast(
                    msg:
          "You have picked this expert successfully", //yalla
          gravity: ToastGravity.CENTER,
         toastLength: Toast.LENGTH_LONG,
        fontSize: 15,
      );
  }

  Widget build(BuildContext context) {
    controller.getUser();

    int x = controller.get_list(Get.arguments).length;

    return Scaffold(
      appBar: AppBar(title: Text("My Questions")),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 5.0,
              shadowColor: Colors.blue,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              child: ListTile(
                trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                    ),
                    color: Colors.red,
                    onPressed: () {
                      controller.delete_question(category: Get.arguments);
                      Get.off(navigationClient());
                    }),
                title: Text(
                  "${controller.get_question(category: Get.arguments)}",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0.0,
              width: 150.0,
            ),
            Text(
              '\n    Interested Experts\n',
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc(controller.myUser.value.uid)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return(Text("Loading")) ; 
                  }
                  else if (snapshot.hasError)
                  {
                    return(Text("Error")) ; 
                  }
                  else 
                  {}
                  print("wathc meeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
                  print(snapshot.data["name"]);
                  String field = Get.arguments;
                  String field2 = field[0].toUpperCase() + field.substring(1);
                  List experts = snapshot.data["interested$field2"];
                  print(experts);
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: experts.length,
                    itemBuilder: (BuildContext context, int index) {
                      print("Paulaaaaaaaaaaaaaaaaaaaaaaaaaa");

                      if (experts.length == 0) return (Container());
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: TextButton(
                            child: Text(experts[index]),
                            onPressed: () async{

                              // var f  = await FirebaseFirestore.instance.collection("users").limit(1).where("name", isEqualTo: experts[index]).get(); 
                              // print(f.docs.first.id);
                              
                              // Get.to(ProfileClientView());
                            },
                          ),
                          trailing: TextButton(
                            child: Text("Pick me"),
                            onPressed: ()  async{

                              alreadypicked(experts[index])?  
                               Fluttertoast.showToast(
                                      msg:
                                          "You have already picked this question, check the chat page", //yalla
                                      gravity: ToastGravity.CENTER,
                                      toastLength: Toast.LENGTH_LONG,
                                      fontSize: 15,
                                    ) :  pick(experts[index]) ; 
                                
                              
                           


                            
                            
                              
                              
                            },
                          ),
                        ),
                      );
                    },
                  );
                }),

            // ListView.builder(
            // shrinkWrap: true,
            // physics: ClampingScrollPhysics(),
            //   itemCount: x,
            //   itemBuilder: (BuildContext context, int index)
            //   {
            //     return(  Card(
            //       child: ListTile(
            //         leading: Icon(Icons.person),                             //s2
            //         title: TextButton(child: Text("${controller.get_list(Get.arguments)[index]}"), onPressed: ()  {},               ),
            //         trailing: TextButton(child: Text("Pick me"), onPressed: ()  {},               ),
            //       )
            //       ,
            //     )   );
            //   },
            // )  ,
          ],
        ),
      ),
    );
  }
}