import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/chat/converstion.dart';
import 'package:firebase_app/pages/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Contacts extends StatelessWidget { 

   final UserController controller = Get.put(UserController());


  Future<String>  putImage(String name) async
  {
    final x = await FirebaseFirestore.instance.collection("users").where("name", isEqualTo: name).get() ; 
    final l = x.docs ; 
    final d = l.first ; 
    var url  = d.data()["imageURL"] ; 
    print("Siiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii") ; 
    print(url) ; 
    return(url) ; 


    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Contacts"),),

      body: Container(
        child: StreamBuilder<DocumentSnapshot> (
          stream:  FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).snapshots(),
          builder:   (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) 
          {
            if(snapshot.connectionState== ConnectionState.waiting) 
            {
              return Container() ; 
            }
            // List l = snapshot.data["chatPeople"] ; 
            return ListView.builder(
              itemCount: snapshot.data["chatPeople"].length , 
              // itemCount: 1,
              itemBuilder: (BuildContext context, int index) 
              {
                print("inmnnnks") ; 
                print(index) ; 
                
                // String s = l[index] ; 
                List l = snapshot.data["chatPeople"] ;
                return GestureDetector (

                  onTap: () { 
                    String me = controller.myUser.value.name ; 
                    String other = l[index] ; 
                    print("Siiiii") ; 
                    Get.to(Converstion(me: me,other: other)) ; 
                  }, // Conversation("")
                  child: Card(
                    child: ListTile(
                      leading:  FutureBuilder<String> (
                        future: putImage("${l[index]}"),
                        builder: (context, AsyncSnapshot<String> snapshot) {
                          if (snapshot.hasData) {
                            if(snapshot.data=="") return CircleAvatar(backgroundImage: AssetImage("assets\\blank-profile-picture")) ; 
                            else return CircleAvatar(backgroundImage: NetworkImage(snapshot.data)) ; 
                          }
                          else
                          {
                            return CircularProgressIndicator();
                          }
                        }
                      )
                       , 
                      title: Text("${l[index]}"),
                      
                      
                      // leading: Text("s"),
                    ),
                  ),
                ); 
              },
              

              ) ; 
          }
          ,
        ),
      ),
      
    );
  }
}

