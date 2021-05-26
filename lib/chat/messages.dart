
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/chat/message_bubble.dart';
import 'package:firebase_app/pages/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Messages extends StatelessWidget {

  String me ; 
  String other ; 

  Messages({this.me,this.other}) ; 

  final UserController controller = Get.put(UserController());
  
  
  @override
  Widget build(BuildContext context) {
    String collection ; 
    controller.myUser.value.type=="client"? collection=me+"_"+other : collection=other+"_"+me ; 
   
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("$collection").orderBy("time",descending: true).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot>chatSnapshot) {
        if(chatSnapshot.connectionState==ConnectionState.waiting) 
        {
          return(Center(child: CircularProgressIndicator(),)) ;    
        }
        final chatdocs =  chatSnapshot.data.docs ; 
          return ListView.builder(
            reverse: true,
             itemCount: chatdocs.length    ,
             itemBuilder: (context,index) => MessageBubble(
               chatdocs[index]['text'], 
              //  futureSnapshot.data.uid==chatdocs[index]['uid'] 
              FirebaseAuth.instance.currentUser.uid==chatdocs[index]['uid'],
               chatdocs[index]['time'],
               chatdocs[index]['type'],
               )
               ) ; 
          
    
        
      },
    );
  }
}




