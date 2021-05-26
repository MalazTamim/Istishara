import '../grid/list_of_categories.dart';
import 'reset.dart';
import 'sign_up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/authenticationProvider.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../pages/ask_question.dart';
import '../pages/navigationClient.dart';

class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // backgroundColor: Colors.blue,
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Image.asset(
              "assets/images/signup.png",
              fit: BoxFit.contain,
              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              height: 300,
              width: 200,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: new Theme(
                data: new ThemeData(
                  primaryColor: Colors.blue,
                  primaryColorDark: Colors.blue,
                ),
                child: TextField(
                  controller: emailController,

// shadows: [Shadow(color: Colors.yellow, blurRadius: 2)],

                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.blue)),

                    // border: OutlineInputBorder(),

                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                  ),
                ),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
                width: MediaQuery.of(context).size.width,
                child: Divider(
                  color: Colors.white,
                )),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0),
              child: new Theme(
                data: new ThemeData(
                  primaryColor: Colors.blue,
                  primaryColorDark: Colors.blue,
                ),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                  ),
                ),
              ),
            ),

            // SizedBox(
            //     height: MediaQuery.of(context).size.height*0.005,
            //     width: MediaQuery.of(context).size.width,
            //     child: Divider(
            //       color: Colors.white,
            //     )),

            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              TextButton(
                child: Text(
                  "Forgot password",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Get.to(ResetScreen());
                },
              ),
            ]),
            // SizedBox(
            //     height: MediaQuery.of(context).size.height*0.008,
            //     width: MediaQuery.of(context).size.width,
            //     child: Divider(
            //       color: Colors.white,
            //     )),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.only(
                left: 0,
                right: 0,
                top: 0,
                bottom: 1,
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 1.0, left: 8, right: 8),
                child: Container(
                  // height: 50,
                  // width: 210,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                    onPressed: () async {
                      await context.read<AuthenticationProvider>().logIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim());
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.07,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Do not have an account?",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                  ),
                ),
                TextButton(
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: MediaQuery.of(context).size.width * 0.042,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Get.to(Sign_up());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
