import 'package:firebase_app/chat/contacts.dart';
import 'package:firebase_app/pages/Experthome.dart';
import 'package:firebase_app/pages/PostingQuestion.dart';
import 'package:firebase_app/pages/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'ExpertProfile.dart';
import 'chatExpert.dart';
import 'Experthome.dart';

class navControllerexpert extends GetxController {
  final _selectedIndex = 0.obs;
  get selectedIndex => this._selectedIndex.value;
  set selectedIndex(index) => this._selectedIndex.value = index;
}

class navigationExpert extends StatelessWidget {
     final UserController controller = Get.put(UserController());
  @override
  Widget build(BuildContext ctx) {
    final navControllerexpert navcontrol = Get.put(navControllerexpert());
    final List<Widget> bodyContent = [
      Experthome(),
      // chatExpert(),
      Contacts(),
      ExpertProfile()

      // put here all pages you need
    ];
    return Scaffold(
      body: Obx(
        () => Center(
          child: bodyContent.elementAt(navcontrol.selectedIndex),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.blue),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books, color: Colors.blue),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.blue),
              label: "My Profile",
            ),
          ],
          currentIndex: navcontrol.selectedIndex,
          onTap: (index) => Get.to(navcontrol.selectedIndex = index),
        ),
      ),
    );
  }
}
