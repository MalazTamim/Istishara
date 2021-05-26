import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MyUser {


  String uid ; 
  String name;
  String email;
  String phoneNumber;
  String type;
  String field;

  String architect ="" ; 
  String civil ="";
  String construction ="";   
  String doctor =""; 
  String electrical="" ; 
  String family =""; 
  String heating =""; 
  String mechanical="" ; 
  String psych =""; 

  List interestedArchitect = [] ;
  List interestedCivil = [] ;
  List interestedConstruction = [] ;
  List interestedDoctor = [] ;
  List interestedElectrical = [] ;
  List interestedFamily = [] ; 
  List interestedHeating = [] ; 
  List interestedMechanical = [] ; 
  List interestedPsych = [] ; 


  List chatPeople = []; 

  String imageURL = "" ; 

  double rating = 0 ; 
  String about="" ; 
  String skill1 = ""; 
  String skill2 = "";
  String skill3 = "";
  String skill4 = "";
  String skill5 = "";
  String skill6 = "";

  // String currentfield = "" ; 

  MyUser.expert({this.name,this.about,this.skill1,this.skill2,this.skill3,this.skill4,this.skill5,this.skill6,this.rating,this.imageURL});

  MyUser({this.name, this.field, this.email, this.type, this.phoneNumber});

 


  void add_question({String question, String field}) 
  {

    FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).update(
      {
        "$field" : question 
      }
    );
  }

  void delete_question({String category}) 
  {
    FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).update(
      {
        "$category" : "" 
      }
    );

    String capCategory = category[0].toUpperCase() + category.substring(1) ;  
    // String s = "interested$capCategory" ; 
    FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).update(
      {
        "interested$capCategory" : [] 
      }
    );

  }




  


}
