import 'dart:io';

import 'package:firebase_app/authenticationProvider.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_app/pages/list_of_categories.dart';
// import 'package:firebase_app/pages/log_in.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

class Sign_up extends StatefulWidget {
  @override
  _Sign_upState createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool isexpert = false;
  String dropdownValue = 'Doctor';


  File pickedImageFile ; 
  PickedFile pickedImage ; 
  final picker = ImagePicker();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      // resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Create a new account"),
      ),
      body: ListView(
        children: [
          // SizedBox(height: 30),
           Padding(
             padding: const EdgeInsets.only(top:4.0),
             child: CircleAvatar(radius: 60,  backgroundColor: Colors.blue[600],
             
             backgroundImage: pickedImageFile==null ? null : FileImage(pickedImageFile),
             ),
           ),

           
          TextButton.icon( 
            onPressed: ()  async{
               pickedImage = await picker.getImage(source: ImageSource.gallery, imageQuality: 50) ;  
              setState(()  {

                if(pickedImage!=null) 
                {
                pickedImageFile = File(pickedImage.path) ;
                // String s = pickedImage.hashCode.toString() ; 
                // final ref =  FirebaseStorage.instance.ref().child("profiles").child("$s.jpg") ; 
                // await ref.putFile(pickedImageFile) ; 
                // imageURL = await ref.getDownloadURL() ; 
                }
                else
                {
                  print("No image was picked siiiiiiiiiiiiiiiiiiiiiiiiiiii") ; 
                }

              });

            }, 
            icon: Icon(Icons.image), 
            label:  Text("Add image")),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Full Name",
                labelText: "Full Name",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: "Phone Number",
                labelText: "Phone Number",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            children: [
              // SizedBox(width: 29),
              Text(
                "Expert",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.blue,
                  value: this.isexpert,
                  onChanged: (bool value) {
                    setState(() {
                      this.isexpert = value;
                    });
                  }),
              Container(
                child: !isexpert
                    ? Container(
                        width: 0,
                      )
                    : Container(
                      width: 230,
                      child: DropdownButton<String>(
                          hint: Text("Field"),
                          value: dropdownValue,
                          // icon: Icon(Icons.check_box_outline_blank_sharp, color: Colors.blue,),
                          iconSize: 10,
                          elevation: 10,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          underline: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>[
                            'Doctor',
                            'Electrical Engineer',
                            'Civil Engineer',
                            'Construction Engineer',
                            'Architect',
                            'Psychologist',
                            'Mechanical Enginner',
                            'Heating & cooling Engineer',
                            'Family practitioner'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                    ),
              ),
            ],
          ),
          // SizedBox(height: 30),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: FlatButton(
              onPressed: () async {
                await context.read<AuthenticationProvider>().signUp(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    name: nameController.text.trim(),
                    phoneNumber: phoneController.text.trim(),
                    isexpert: isexpert,
                    field: dropdownValue,
                    pickedImageFile: pickedImageFile,
                    pickedImage : pickedImage 
                    );
              },
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}