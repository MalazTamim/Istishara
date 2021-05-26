import 'dart:io';
import 'dart:async';
import 'package:firebase_app/chat/pdfi.dart';
import 'package:firebase_app/pages/user_controller.dart';
import 'package:firebase_app/search/search.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'categories_build.dart';
import '../login/log_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/authenticationProvider.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import '../pages/navigationClient.dart';
import 'package:flutter/cupertino.dart';
import 'package:file_picker/file_picker.dart';

// import 'myProfile.dart';

final List<String> categoriesList = [
  "Architect",
  "Civil Engineer",
  "Construction Engineer",
  "Doctor",
  "Electrical Engineer",
  "Family practitioner",
  "Heating & cooling Engineer",
  "Mechanical Enginner",
  "Psychologist",
];

final List<String> categoriesListIcons = [
  "assets/images/icons/architect.png",
  "assets/images/icons/civil.png",
  "assets/images/icons/construction.png",
  "assets/images/icons/doctor.png",
  "assets/images/icons/electrical.png",
  "assets/images/icons/family.png",
  "assets/images/icons/heating.png",
  "assets/images/icons/mechanical.png",
  "assets/images/icons/psychologist.png",
];

class ListCategories extends StatefulWidget {
  @override
  _ListCategoriesState createState() => _ListCategoriesState();
}

class _ListCategoriesState extends State<ListCategories> {
  UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    controller.getUser();

    final PreferredSizeWidget appBar =

    // = Platform.isIOS ?

    //   CupertinoNavigationBar(
    //         middle:Text("Choose a Category",
    //       style: TextStyle(
    //           color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
    //         trailing: Row(
    //           mainAxisSize: MainAxisSize.min, //it might lead to a
    //           children: <Widget>[
    //             RaisedButton.icon(
    //         color: Colors.blue[600],
    //         icon: GestureDetector(
    //               child: Icon(CupertinoIcons.arrowshape_turn_up_left),
    //               onTap: () async{
    //           context.read<AuthenticationProvider>().signOut();
    //           Get.off(Login());

    //         },
    //             ),
    //         onPressed: ()  async{
    //           context.read<AuthenticationProvider>().signOut();
    //           Get.off(Login());

    //         },
    //         label: Text(
    //           "Log out",
    //           style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //             color: Colors.white,
    //             fontSize: 15,
    //           ),
    //         ))

    //           ],
    //         ),
    //         backgroundColor: Colors.blue[600],
    //       )

    // :

    AppBar(
      // leading: Container(height: 0, width: 0,),
      title: Text("Choose a Category",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
      backgroundColor: Colors.blue[600],
      actions: [
        RaisedButton.icon(
            color: Colors.blue[600],
            icon: Icon(Icons.login),
            onPressed: () async {
              context.read<AuthenticationProvider>().signOut();
              Get.off(Login());
              // Get.to(PDFI()) ;
              //     print("attachhhhhhhhhhhhhhhh") ;
              //     FilePickerResult result = await FilePicker.platform.pickFiles(type: FileType.custom,
              // allowedExtensions: ['pdf', 'doc'],);

              //     if(result != null) {
              //   File file = File(result.files.single.path);
              //   PlatformFile pfile = result.files.first;
              //   if(pfile.extension=="pdf")
              //   {
              //     print("Ohoooooooooo") ;
              //     print(pfile.path);
              //     print(file.path) ;
              //     String s = file.hashCode.toString();
              //     final ref =  FirebaseStorage.instance.ref().child("users").child("$s.pdf") ;
              //     await ref.putFile(file) ;
              //     // final url = await ref.getDownloadURL() ;

              //   }
              //   } else {
              // // User canceled the picker
              // }
            },
            label: Text(
              "Log out",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 15,
              ),
            )),
      ],
    );

    final txListWidget = Container(
        height: (MediaQuery.of(context).size.height -
            appBar.preferredSize.height -
            MediaQuery.of(context).padding.bottom -
            MediaQuery.of(context).padding.top

            // - navigationClient.Scaffold.of(context).
            -
            (MediaQuery.of(context).size.height) * 0.1),
        child: CategoriesListBuild(categoriesList, categoriesListIcons));

    final categoriesBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Center(
            //   child: Container(
            //     padding: EdgeInsets.all(4),
            //   ),
            // ),
            txListWidget,
            // Container(
            //   padding: EdgeInsets.all(9),
            // )
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: categoriesBody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: categoriesBody,
          );
  }
}