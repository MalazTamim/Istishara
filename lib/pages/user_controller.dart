import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/pages/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var myUser = MyUser().obs;



  @override
  void onInit() async {
    super.onInit();
    print("111111111111");
    getUser();
    print("2222222222222222222");
  }

  Future<void> setProfile(String about, String skill1, String skill2, String skill3, String skill4, String skill5, String skill6) async
  {
    if(about!=myUser.value.about && about!=null) 
    {
      print("Ohhhhhhhhhhhhhhhh $about") ; 
       myUser.update((val) {val.about = about ; }) ; 
       await FirebaseFirestore.instance.collection("users").doc(myUser.value.uid).update({"about": about}) ; 
    }
   
    if(skill1!=myUser.value.skill1 && skill1!=null) 
    {
      myUser.update((val) {val.skill1 = skill1 ; }) ;
      await FirebaseFirestore.instance.collection("users").doc(myUser.value.uid).update({"skill1": skill1}) ; 
    }

    if(skill2!=myUser.value.skill2  && skill2!=null) 
    {
      myUser.update((val) {val.skill2 = skill2 ; }) ;
      await FirebaseFirestore.instance.collection("users").doc(myUser.value.uid).update({"skill2": skill2}) ;

    }
   
    if(skill3!=myUser.value.skill3  && skill3!=null) 
    {
      myUser.update((val) {val.skill3 = skill3 ; }) ;
      FirebaseFirestore.instance.collection("users").doc(myUser.value.uid).update({"skill3": skill3}) ;
    }
    
    if(skill4!=myUser.value.skill4  && skill4!=null) 
    {
       myUser.update((val) {val.skill4 = skill4 ; }) ;
       FirebaseFirestore.instance.collection("users").doc(myUser.value.uid).update({"skill4": skill4})  ; 
    }
   
    if(skill5!=myUser.value.skill5  && skill5!=null) 
    {
      myUser.update((val) {val.skill5 = skill5 ; }) ; 
      FirebaseFirestore.instance.collection("users").doc(myUser.value.uid).update({"skill5": skill5}) ;
    }
    
    if(skill6!=myUser.value.skill6  && skill6!=null)
    {
      myUser.update((val) {val.skill6 = skill6 ; }) ;
      FirebaseFirestore.instance.collection("users").doc(myUser.value.uid).update({"skill6": skill6})  ;
    }
     



    
  }

  List get_list(String category) 
  { 
    if(category=="architect") 
    {
        return(myUser.value.interestedArchitect) ; 

    }
    else if(category=="civil") 
    {
         return(myUser.value.interestedCivil) ;  
    }
    else if(category=="construction") 
    {
         return(myUser.value.interestedConstruction) ;  
    }
    else if(category=="doctor") 
    {
         return(myUser.value.interestedDoctor) ;  
    }
     else if(category=="electrical") 
    {
         return(myUser.value.interestedElectrical) ;  
    }
    else if(category=="family") 
    {
         return(myUser.value.interestedFamily) ;  
    }
    else if(category=="heating") 
    {
         return(myUser.value.interestedHeating) ; 
    }
    else if(category=="mechanical") 
    {
         return(myUser.value.interestedMechanical) ; 
    }
    else if(category=="psych") 
    {
        return(myUser.value.interestedPsych) ; 
    }
  }

  void getUser() async {
    try {
      DocumentSnapshot c = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .get();
      Map<String, dynamic> myMap = c.data();
      print(
          "This issssssssssssssssssssssssssssssssssssssssssssssssssssss user controller");
      print(c.data()["type"]);
      if (myMap["type"] == "client") {
        myUser.update((value) {
          value.name = c["name"];
          value.email = c["email"];
          value.phoneNumber = c["phoneNumber"];
          value.type = "client";
          value.architect = c["architect"] ;
          value.civil = c["civil"] ;
          value.construction = c["construction"] ;
          value.doctor = c["doctor"] ;
          value.electrical = c["electrical"] ;
          value.family = c["family"] ;
          value.heating = c["heating"] ;
          value.mechanical = c["mechanical"] ;
          value.psych = c["psych"] ; 
          value.interestedArchitect = c["interestedArchitect"] ; 
          value.interestedCivil = c["interestedCivil"] ; 
          value.interestedConstruction = c["interestedConstruction"] ; 
          value.interestedDoctor = c["interestedDoctor"] ; 
          value.interestedElectrical = c["interestedElectrical"] ; 
          value.interestedFamily = c["interestedFamily"] ; 
          value.interestedHeating = c["interestedHeating"] ; 
          value.interestedMechanical = c["interestedMechanical"] ; 
          value.interestedPsych = c["interestedPsych"] ; 
          value.uid = c["uid"] ;
          value.chatPeople = c["chatPeople"] ; 
          value.imageURL = c["imageURL"] ; 


        });
        update();
      } else if (myMap["type"] == "expert") {
        myUser.update((value) {
          value.name = c["name"];
          value.email = c["email"];
          value.phoneNumber = c["phoneNumber"];
          value.type = "expert";
          value.field = c["field"];
          value.uid = c["uid"] ;
          value.chatPeople = c["chatPeople"] ; 
          value.imageURL = c["imageURL"] ; 
          value.about = c["about"] ; 
          value.skill1 = c["skill1"] ;
          value.skill2 = c["skill2"] ;
          value.skill3 = c["skill3"] ;
          value.skill4 = c["skill4"] ; 
          value.skill5 = c["skill5"] ;
          value.skill6 = c["skill6"] ;

        });

        update();
      } else {
        print("There is something in User controller");
      }
    } catch (e) {
      print("fi error wlakkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
      print(e);
    }
  }


  void add_question({String question, String category})
  {
    myUser.value.add_question(question: question, field: category) ; 
    print("Yalaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    print(myUser.value.psych) ;
    if(category=="architect") 
    {
         myUser.update((value) {value.architect = question ; }) ; 

    }
    else if(category=="civil") 
    {
         myUser.update((value) {value.civil = question ; }) ; 
    }
    else if(category=="construction") 
    {
         myUser.update((value) {value.construction = question ; }) ; 
    }
    else if(category=="doctor") 
    {
         myUser.update((value) {value.doctor = question ; }) ; 
    }
     else if(category=="electrical") 
    {
         myUser.update((value) {value.electrical = question ; }) ; 
    }
    else if(category=="family") 
    {
         myUser.update((value) {value.family = question ; }) ; 
    }
    else if(category=="heating") 
    {
         myUser.update((value) {value.heating = question ; }) ; 
    }
    else if(category=="mechanical") 
    {
         myUser.update((value) {value.mechanical = question ; }) ; 
    }
    else if(category=="psych") 
    {
         myUser.update((value) {value.psych = question ; }) ; 
    }
  }

  String get_question({String category}) 
  {
    if(category=="architect") 
    {
        return(myUser.value.architect)  ;  
    }
    else if (category =="civil")
    {
      return(myUser.value.civil) ; 
    }
    else if (category =="construction")
    {
      return(myUser.value.construction) ; 
    }
     else if (category =="doctor")
    {
      return(myUser.value.doctor) ; 
    }
     else if (category =="electrical")
    {
      return(myUser.value.electrical) ; 
    }
     else if (category =="family")
    {
      return(myUser.value.family) ; 
    }
     else if (category =="heating")
    {
      return(myUser.value.heating) ; 
    }
     else if (category =="mechanical")
    {
      return(myUser.value.mechanical) ; 
    }
     else if (category =="psych")
    {
      return(myUser.value.psych) ; 
    }

  }

  void delete_question({String category}) 
  {
    if(category=="architect") 
    {
        myUser.update((value) {value.architect = "" ; }) ; 
        myUser.value.delete_question(category: category) ; 
        myUser.update((value) {value.interestedArchitect = [] ; }) ;
    }
    else if (category =="civil")
    {
      myUser.update((value) {value.civil = "" ; }) ; 
      myUser.value.delete_question(category: category) ; 
      myUser.update((value) {value.interestedCivil = [] ; }) ;

    }
    else if (category =="construction")
    {
      myUser.update((value) {value.construction = "" ; }) ; 
      myUser.value.delete_question(category: category) ; 
      myUser.update((value) {value.interestedConstruction = [] ; }) ;
    }
     else if (category =="doctor")
    {
      myUser.update((value) {value.doctor = "" ; }) ; 
      myUser.value.delete_question(category: category) ; 
      myUser.update((value) {value.interestedDoctor = [] ; }) ;
    }
     else if (category =="electrical")
    {
      myUser.update((value) {value.electrical = "" ; }) ; 
      myUser.value.delete_question(category: category) ; 
      myUser.update((value) {value.interestedElectrical = [] ; }) ;
    }
     else if (category =="family")
    {
      myUser.update((value) {value.family = "" ; }) ; 
      myUser.value.delete_question(category: category) ; 
      myUser.update((value) {value.interestedFamily = [] ; }) ;
    }
     else if (category =="heating")
    {
      myUser.update((value) {value.heating = "" ; }) ; 
      myUser.value.delete_question(category: category) ; 
      myUser.update((value) {value.interestedHeating = [] ; }) ;
    }
     else if (category =="mechanical")
    {
      myUser.update((value) {value.mechanical = "" ; }) ; 
      myUser.value.delete_question(category: category) ; 
      myUser.update((value) {value.interestedMechanical = [] ; }) ;
    }
     else if (category =="psych")
    {
      myUser.update((value) {value.psych = "" ; }) ; 
      myUser.value.delete_question(category: category) ; 
      myUser.update((value) {value.interestedPsych = [] ; }) ;
    }
  }

  String get_field()
  {
    return(myUser.value.field) ; 
  }

  Future<bool> is_intersted({String ClientId}) async
  { 
    var myclient = await FirebaseFirestore.instance.collection("users").doc(ClientId).get() ; 
    if(myUser.value.field=="architect") 
    {
      List intersted = myclient["interestedArchitect"] ; 
      for (var i = 0 ; i< intersted.length ; i++)
      {
        if(myUser.value.uid == intersted[i] ) return true ; 
      }
      return false ; 
    }
    else if(myUser.value.field=="civil") 
    {
      List intersted = myclient["interestedCivil"] ; 
      for (var i = 0 ; i< intersted.length ; i++)
      {
        if(myUser.value.uid == intersted[i] ) return true ; 
      }
      return false ; 
    }
    else if(myUser.value.field=="construction") 
    {
      List intersted = myclient["interestedConstruction"] ; 
      for (var i = 0 ; i< intersted.length ; i++)
      {
        if(myUser.value.uid == intersted[i] ) return true ; 
      }
      return false ; 
    }
    else if(myUser.value.field=="doctor") 
    {
      List intersted = myclient["interestedDoctor"] ; 
      for (var i = 0 ; i< intersted.length ; i++)
      {
        if(myUser.value.uid == intersted[i] ) return true ; 
      }
      return false ; 
    }
    else if(myUser.value.field=="electrical") 
    {
      List intersted = myclient["interestedElectrical"] ; 
      for (var i = 0 ; i< intersted.length ; i++)
      {
        if(myUser.value.uid == intersted[i] ) return true ; 
      }
      return false ; 
    }
    else if(myUser.value.field=="family") 
    {
      List intersted = myclient["interestedFamily"] ; 
      for (var i = 0 ; i< intersted.length ; i++)
      {
        if(myUser.value.uid == intersted[i] ) return true ; 
      }
      return false ; 
    }
     else if(myUser.value.field=="heating") 
    {
      List intersted = myclient["interestedHeating"] ; 
      for (var i = 0 ; i< intersted.length ; i++)
      {
        if(myUser.value.uid == intersted[i] ) return true ; 
      }
      return false ; 
    }
    else if(myUser.value.field=="mechanical") 
    {
      List intersted = myclient["interestedMechanical"] ; 
      for (var i = 0 ; i< intersted.length ; i++)
      {
        if(myUser.value.uid == intersted[i] ) return true ; 
      }
      return false ; 
    }
     else if(myUser.value.field=="psych") 
    {
      List intersted = myclient["interestedPsych"] ; 
      for (var i = 0 ; i< intersted.length ; i++)
      {
        if(myUser.value.uid == intersted[i] ) return true ; 
      }
      return false ; 
    }

  }


  
    Future<String> si({String ClientId}) async 
    {
      if( await is_intersted(ClientId: ClientId)) return ("Picked") ; 
      else return("") ; 

    }

   Map get_questions() 
   {
     
   }

}