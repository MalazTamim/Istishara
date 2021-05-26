import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../profile//Profile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_app/pages/user_controller.dart';
import 'package:image_picker/image_picker.dart';
import '../profile/editProfile.dart';
import '../login/reset.dart';

class ExpertProfile extends StatefulWidget {
  @override
  _ExpertProfileState createState() => _ExpertProfileState();
}

class _ExpertProfileState extends State<ExpertProfile> {
  UserController controller = Get.put(UserController());

  File pickedImageFile;

  PickedFile pickedImage;

  final picker = ImagePicker();

  // List<bool> selections = List.generate(2, () => false);

  createAlertDialogAboutApp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Istishara is a Mobile App that connects clients seeking help with experts in a specific field.\n\nIf you are a client and need help, go post your question or search for an expert! If you are an expert, go pick a question!",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                  elevation: 5.0,
                  child: Text(
                    "OK",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  createAlertDialogContactUs(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title:
                Text("\nFor more information, don't hesitate to contact us at"),
            content: Text(
              "istishara0@gmail.com",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                  elevation: 5.0,
                  child: Text(
                    "Done",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  // createAlertDialogNotificationSettings(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text(
  //             "Notification Settings",
  //             style: TextStyle(
  //               fontWeight: FontWeight.bold,
  //               fontSize: 20.0,
  //             ),
  //           ),
  //           actions: <Widget>[
  //             ToggleButtons(
  //               children: [
  //                 Text(
  //                   "OFF",
  //                   style: TextStyle(fontSize: 18.0),
  //                 ),
  //                 Text(
  //                   "ON",
  //                   style: TextStyle(fontSize: 18.0),
  //                 ),
  //               ],
  //               isSelected: _selections,
  //               onPressed: (int index) {},
  //               //selectedColor: Colors.blue,
  //               borderRadius: BorderRadius.circular(22.0),
  //               borderWidth: 5,
  //               borderColor: Colors.blue,
  //             ),
  //           ],
  //         );
  //       });
  // }

  createAlertDialogPassword(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Reset password",
                style: TextStyle(fontWeight: FontWeight.bold)),
            content: Text(
              "\nCheck your email to reset your password!",
              style: TextStyle(fontSize: 20.0),
            ),
            actions: <Widget>[
              MaterialButton(
                  elevation: 5.0,
                  child: Text(
                    "OK",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var count = 100.obs;
    // controller.getUser();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "My Profile",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20),
          // Center(
          //     child: Obx(() => CircleAvatar(
          //           child: Padding(
          //             padding: const EdgeInsets.only(top: 85, left: 100),

          //           ),
          //           radius: 70,
          //           backgroundImage: controller.myUser.value.imageURL == ""
          //               ? AssetImage("assets\\blank-profile-picture")
          //               : NetworkImage(controller.myUser.value.imageURL),
          //           backgroundColor: Colors.blue,
          //         ))),
          //
          Center(
            child: Obx(() => CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("assets/images/loading.gif"),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 70,
                    backgroundImage: NetworkImage(
                      controller.myUser.value.imageURL,
                    ),
                  ),
                  // backgroundColor: Colors.blue,
                )),
          ),

          TextButton.icon(
              onPressed: () async {
                pickedImage = await picker.getImage(
                    source: ImageSource.gallery, imageQuality: 50);
                setState(() async {
                  if (pickedImage != null) {
                    pickedImageFile = File(pickedImage.path);
                    String s = pickedImage.hashCode.toString();
                    final ref = FirebaseStorage.instance
                        .ref()
                        .child("profiles")
                        .child("$s.jpg");
                    await ref.putFile(pickedImageFile);
                    String imageURL = await ref.getDownloadURL();
                    controller.myUser.value.imageURL = imageURL;
                    await FirebaseFirestore.instance
                        .collection("users")
                        .doc(controller.myUser.value.uid)
                        .update({"imageURL": imageURL});
                  } else {
                    print("No image was picked siiiiiiiiiiiiiiiiiiiiiiiiiiii");
                  }
                });
              },
              icon: Icon(Icons.image),
              label: Text("Change image")),
          // SizedBox(height: 10),
          Center(
            child: Container(
              child: TextButton(
                child: Obx(
                  () => Text(
                    "${controller.myUser.value.name}",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onPressed: () {
                  Get.to(Profile());
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  //color: Colors.yellow[100],
                  border: Border.all(
                    color: Colors.grey[400],
                    // style: border_style_rounded,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        " My Balance:  ",
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Obx(
                        () => Text(
                          "$count \$",
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: Colors.black26,
            ),
          ),
          SizedBox(height: 5),
          InkWell(
            onTap: () {
              Get.to(editProfile());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: StadiumBorder(
                  //Card with stadium border
                  side: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      //Padding: EdgeInsets.all(value)
                      //mainAxisAlignment: MainAxisAlignment.,

                      children: <Widget>[
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(editProfile());
                          },
                          child: Text(
                            " Edit profile",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Card(
          //     shape: StadiumBorder(
          //       //Card with stadium border
          //       side: BorderSide(
          //         color: Colors.blue,
          //         width: 2.0,
          //       ),
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Row(
          //           //Padding: EdgeInsets.all(value)
          //           //mainAxisAlignment: MainAxisAlignment.,

          //           children: <Widget>[
          //             SizedBox(
          //               width: 7,
          //             ),
          //             Icon(
          //               Icons.settings,
          //               color: Colors.blue,
          //             ),
          //             TextButton(
          //               onPressed: () {
          //                 createAlertDialogNotificationSettings(context);
          //               },
          //               child: Text(
          //                 "Notification Settings",
          //                 style: TextStyle(
          //                   fontSize: 20,
          //                   color: Colors.black,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //             ),
          //           ]),
          //     ),
          //   ),
          // ),

          InkWell(
            onTap: () {
              // createAlertDialogPassword(context);
              Get.to(ResetScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: StadiumBorder(
                  //Card with stadium border
                  side: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      //Padding: EdgeInsets.all(value)
                      //mainAxisAlignment: MainAxisAlignment.,

                      children: <Widget>[
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.assignment,
                          color: Colors.blue,
                        ),
                        // TextButton(
                        //   onPressed: () {
                        //     createAlertDialogPassword(context);
                        //   },
                        //   child: 
                          
                          TextButton(
                            child: Text("Password and Security",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),
                            onPressed: () {
                              Get.to(ResetScreen());
                            },
                          ),
                        
                      ]),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              createAlertDialogAboutApp(context);
            },
                      child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: StadiumBorder(
                  //Card with stadium border
                  side: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      //Padding: EdgeInsets.all(value)
                      //mainAxisAlignment: MainAxisAlignment.,

                      children: <Widget>[
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.info,
                          color: Colors.blue,
                        ),
                        // TextButton(
                        //   onPressed: () {
                        //     createAlertDialogAboutApp(context);
                        //   },
                        //   child: 
                          TextButton(
                            onPressed: ()  {
                              createAlertDialogAboutApp(context);
                            } ,
                            child:Text( "About App",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        
                      ]),
                ),
              ),
            ),
          ),


          InkWell(
            onTap: () {
              createAlertDialogContactUs(context);
            },
                      child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: StadiumBorder(
                  //Card with stadium border
                  side: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    //Padding: EdgeInsets.all(value)
                    //mainAxisAlignment: MainAxisAlignment.,

                    children: <Widget>[
                      SizedBox(
                        width: 7,
                      ),
                      Icon(
                        Icons.contact_phone,
                        color: Colors.blue,
                      ),
                      TextButton(
                        onPressed: () {
                          createAlertDialogContactUs(context);
                        },
                        // child: TextButton(
                        //   onPressed: () {
                        //     createAlertDialogContactUs(context);
                        //   },
                          child: 
                          Text(
                          "Contact Us",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),),
                        
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}