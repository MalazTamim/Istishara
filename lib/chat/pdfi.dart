import 'dart:io';
import 'package:firebase_app/chat/pdfview.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PDFI extends StatefulWidget {
  @override
  _PDFIState createState() => _PDFIState();
}

class _PDFIState extends State<PDFI> {

  String myurl = "" ; 

  Future<void> getfile() async
  {
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
              print("Juveeeeeeeeeeeeeeeeeeeee")  ;
              print(url) ; 
            
              setState(() {
                              // myurl = 'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf' ; 
                              myurl = url ; 
                            });

             Get.to(PFDV(url:url));  

            }
            } else {
          // User canceled the picker
          }
          
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PDF"),),
      body: Column(
        children: [
          RaisedButton(onPressed: getfile, child: Text("Click!"),), 
          // Container(child: 
          // myurl==""? Text("Upload"): PDFViewer(document: docy)
          // ,)
        ],
      ),
    );
  }
}
