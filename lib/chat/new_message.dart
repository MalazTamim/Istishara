
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_app/pages/user_controller.dart';
import 'package:image_picker/image_picker.dart';


class NewMessage extends StatefulWidget {
  
  String me ; 
  String other ; 
  NewMessage({this.me,this.other}) ; 
  @override
  _NewMessageState createState() => _NewMessageState(me: me,other: other);
}

class _NewMessageState extends State<NewMessage> {
  final UserController controller = Get.put(UserController());
  String me ; 
  String other ; 
  _NewMessageState({this.me,this.other}) ; 

  var enteredMessage = "" ; 

  final mycontroller = new TextEditingController() ; 

  File _image;
  final picker = ImagePicker();

  Future<void> sendImage() async {
    
    final pickedImage = await picker.getImage(source: ImageSource.gallery, imageQuality: 50) ; 
    setState (() async  {
      if (pickedImage != null) {
       _image = File(pickedImage.path);
       String s = pickedImage.hashCode.toString() ; 
      final ref =  FirebaseStorage.instance.ref().child("users").child("$s.jpg") ; 
      await ref.putFile(_image) ; 
      // to get it 
      final url = await ref.getDownloadURL() ; 
      // NetworkImage(url) ;  
      String collection ; 
      controller.myUser.value.type=="client" ? collection = me+"_"+other : collection = other+"_"+me ; 
      FirebaseFirestore.instance.collection("$collection").add(
      {
        "text" : url, 
        "time" :  Timestamp.now(), //created time
        "uid" : FirebaseAuth.instance.currentUser.uid,
        "type" : "image"
      });
   
      } else {
        print('No image selected.');
      }
    });
  }


   Future<void> sendPDF() async {
     FilePickerResult result = await FilePicker.platform.pickFiles(type: FileType.custom,
          allowedExtensions: ['pdf', 'doc'],);
     if(result != null) {
            File file = File(result.files.single.path);
            PlatformFile pfile = result.files.first;
            if(pfile.extension=="pdf")
            {
              print("Ohoooooooooo") ; 
              print(pfile.path);
              print(file.path) ; 
              String s = file.hashCode.toString(); 
              final ref =  FirebaseStorage.instance.ref().child("users").child("$s.pdf") ; 
              await ref.putFile(file) ;
              final url = await ref.getDownloadURL() ; 
              String collection ; 
              controller.myUser.value.type=="client" ? collection = me+"_"+other : collection = other+"_"+me ; 
              FirebaseFirestore.instance.collection("$collection").add(
            {
            "text" : url, 
            "time" :  Timestamp.now(), //created time
            "uid" : FirebaseAuth.instance.currentUser.uid,
            "type" : "pdf"
           });
          }
     }
     else{
        print('No image selected.');

     }
   }



  void sendMessage(String me, String other) async
  {
    FocusScope.of(context).unfocus() ; 
    // var user = await FirebaseAuth.instance.currentUser ; 
    String collection ; 
    controller.myUser.value.type=="client" ? collection = me+"_"+other : collection = other+"_"+me ; 
    // 
    FirebaseFirestore.instance.collection("$collection").add(
      {
        "text" : enteredMessage, 
        "time" :  Timestamp.now(), //created time
        "uid" : FirebaseAuth.instance.currentUser.uid,
        "type" : "text"

      }
    ) ; 
    mycontroller.clear() ; 
   
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          
          Expanded(
            child: TextField(
              controller: mycontroller,
              decoration: InputDecoration(labelText: "Send a message..."),
              onChanged: (value) {
                setState(() {
                    enteredMessage = value ; 
                                });
              },
            ),
          ),
          IconButton(
            color: Colors.blue,
            icon: Icon(Icons.send),
            onPressed:  enteredMessage.trim().isEmpty?  null : ()  { sendMessage(me,other) ; }, 
            ),
           IconButton(
            color: Colors.blue,
            icon: Icon(Icons.image),
            onPressed:   sendImage,
            ),
          IconButton(
            color: Colors.blue,
            icon: Icon(Icons.attachment),
            onPressed:  sendPDF,
            ),
        ],
      ),
    );
  }
}

