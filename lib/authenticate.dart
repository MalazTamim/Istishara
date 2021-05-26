// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/chat/converstion.dart';
import 'package:firebase_app/pages/navigationClient.dart';
import 'package:firebase_app/pages/navigationExpert.dart';
import 'package:firebase_app/pages/user_controller.dart';
// import 'package:firebase_app/pages/Profile.dart';
// import 'package:firebase_app/pages/list_of_categories.dart';
import 'login/log_in.dart';
// import 'package:firebase_app/pages/verify.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Authenticate extends StatelessWidget {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          // image :Image.asset("assets/images/signup.png"),
          titleWidget: Column(
            children: <Widget>[
              Container(height: 30),
              Image.asset("assets/images/signup.png"),
              Container(height: 30),
              Text("Never miss an opportunity",
                  style: TextStyle(
                      color: const Color(0xD8172221),
                      fontWeight: FontWeight.bold,
                      fontSize: 22)),
            ],
          ),
          bodyWidget: Column(
            children: <Widget>[
              Text(
                "Easily find a question to answer, chat, and collaborate on the go.",
                style: TextStyle(
                    color: const Color(0xD8172221),
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
//             Container(height:22,),
// Container(
//               height:42,
//               width: 422,
//               padding: const EdgeInsets.only(
//                 left: 0,
//                 right: 0,
//                 top: 0,
//                 bottom: 1,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(bottom: 1.0, left: 8, right: 8),
//                 child: Container(
//                   // height: 50,
//                   // width: 210,
//                   decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(2)),
//                   child: FlatButton(
//                     onPressed: ()  {
//                       Get.to(Login());
//                     },
//                     child: Text(
//                       'Login',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 22,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),),
            ],
          ),

          // footer: Text("Easily find a question to answer, chat, and collaborate on the go. "),
          decoration: const PageDecoration(
            pageColor: const Color(0xffE7E7E9),
            // const Color(0xFFF2F2F3),
          )),
      PageViewModel(
          image: Image.asset("assets/images/onboarding2.png"),
          title: "Collaborate on the go ",
          body: "Chat, share files, and answer questions.",
          // footer: Text("Footer Text  here "),
          decoration: const PageDecoration(
            pageColor: const Color(0xFFF2F2F3),
          )),
      PageViewModel(
          image: Image.asset("assets/images/onboarding1.jpg"),
          // titleWidget: Text(
          title:
            "Find interesting questions and answer them.",
          //   style: TextStyle(
          //       color: const Color(0xD8172221),
          //       fontWeight: FontWeight.bold,
                
          //       fontSize: 16),
          // ),
          body: "Stand out by replying to clients quickly and getting to work.",
          // footer: Text("Footer Text  here "),
          decoration: const PageDecoration(
            pageColor: const Color(0xFFF2F2F3),
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    //Instance to know the authentication state.
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      print(firebaseUser.uid);
      //Means that the user is logged in already and hence navigate to HomePage
      UserController controller = Get.put(UserController());

      print(controller.myUser.value.type);
      if (controller.myUser.value.type == "client") {
        return (navigationClient());
        // return(Converstion()) ;
      } else if (controller.myUser.value.type == "expert") {
        return (navigationExpert());
      } else {
        return (Login());
      }
    } else {
      //The user isn't logged in and hence navigate to SignInPage.
      return Scaffold(
        // appBar: AppBar(
        //   title: Text("Introduction Screen"),
        // ),
        body: IntroductionScreen(
          globalBackgroundColor: Colors.blue[100],
          pages: getPages(),
          showNextButton: false,
          showSkipButton: true,
          skip: Text(
            "Skip",
            style: TextStyle(color: const Color(0xff121A19)),
          ),
          done: Text(
            "Got it ",
            style: TextStyle(color: const Color(0xff121A19)),
          ),
          onDone: () {
            Get.to(Login());
          },
        ),
      );
    }
  }
}
