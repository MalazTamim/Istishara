import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/pages/navigationClient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:firebase_app/pages/user_controller.dart';

class RateMe extends StatefulWidget {
    String name ; 
  @override
  RateMe({this.name}) ; 
  _RateMeState createState() => _RateMeState(name1: name);

  
}

class _RateMeState extends State<RateMe> {
  UserController controller = Get.put(UserController());
  double x;   //x=controller.myUser.value.ratingList
  String name1 ; 
  _RateMeState({this.name1}) ; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [ 

SizedBox(height:34),
              Image.asset(
              "assets/images/rateMe.png",
              fit: BoxFit.contain,
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // height: 300,
              // width: 200,
            ),

SizedBox(height:55),

Center(child: Text("How would you rate you experience with the expert?",
style: TextStyle(color: Colors.black,
fontWeight: FontWeight.bold)
)),
SizedBox(height:15),
              
              
              RatingBar(
          onRatingChanged: (rating) =>
              setState(() => x = rating),
          filledIcon: Icons.star,
          emptyIcon: Icons.star_border,
          halfFilledIcon: Icons.star_half,
          isHalfAllowed: true,
          filledColor: Colors.yellow[700],
          emptyColor: Colors.yellow[700],
          halfFilledColor: Colors.yellow[700],
          size: 48,
                         
        ),
        // Container(
        //   margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        //         height: 45,
        //         width: 100,
        //         decoration: BoxDecoration(
        //             color: Colors.blue,
        //             borderRadius: BorderRadius.circular(20)),
          Row(
                      children: <Widget> [
                        SizedBox(width: MediaQuery.of(context).size.width*0.78),
                        
                        
                        TextButton(
              child: Container(
                width: MediaQuery.of(context).size.width*0.17,
                child: Text("Submit", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold,
                )),
              ),
              onPressed: () async {
            var data = await FirebaseFirestore.instance.collection("users").where("name", isEqualTo: name1).limit(1).get() ; 
            var y = data.docs ;  
            for(var expert  in y) 
            {
        var ex = expert.data() ;  
        var old = ex["rating"] ; 
        print("hahahahahhahahahahahaha") ; 
        double n ; 
        if(old==0) n = x ; 
         else n = (old+x)/2 ; 
         var uid = ex["uid"] ; 
         print(old) ; 
         print(n) ; 
         await FirebaseFirestore.instance.collection("users").doc(uid).update({
             "rating": n 
         });
         Get.back() ; 
      
    }        

            }, ),]
          ),
        
            ],),
    );
  }
}