import 'package:firebase_app/pages/InterestedExperts.dart';
// import 'package:firebase_app/pages/PostingQuestion.dart';
import 'package:firebase_app/pages/ask_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:firebase_app/pages/user_controller.dart';

class CategoriesListBuild extends StatelessWidget {
  final List<String> categoriesList;
  final List<String> categoriesListIconss;
  UserController controller = Get.put(UserController());

  CategoriesListBuild(this.categoriesList, this.categoriesListIconss);

  void gridHandler(index) {
    if (categoriesList[index] == "Architect") {
      if (controller.myUser.value.architect == "") {
        Get.to(AskQuestion(), arguments: "architect");
      } else {
        Get.to(InterestedExperts(), arguments: "architect");
      }
    } else if (categoriesList[index] == "Civil Engineer") {
      if (controller.myUser.value.civil == "") {
        Get.to(AskQuestion(), arguments: "civil");
      } else {
        Get.to(InterestedExperts(), arguments: "civil");
      }
    } else if (categoriesList[index] == "Construction Engineer") {
      if (controller.myUser.value.construction == "") {
        Get.to(AskQuestion(), arguments: "construction");
      } else {
        Get.to(InterestedExperts(), arguments: "construction");
      }
    } else if (categoriesList[index] == "Doctor") {
      if (controller.myUser.value.doctor == "") {
        Get.to(AskQuestion(), arguments: "doctor");
      } else {
        Get.to(InterestedExperts(), arguments: "doctor");
      }
    } else if (categoriesList[index] == "Electrical Engineer") {
      if (controller.myUser.value.electrical == "") {
        Get.to(AskQuestion(), arguments: "electrical");
      } else {
        Get.to(InterestedExperts(), arguments: "electrical");
      }
    } else if (categoriesList[index] == "Family practitioner") {
      if (controller.myUser.value.family == "") {
        Get.to(AskQuestion(), arguments: "family");
      } else {
        Get.to(InterestedExperts(), arguments: "family");
      }
    } else if (categoriesList[index] == "Heating & cooling Engineer") {
      if (controller.myUser.value.heating == "") {
        Get.to(AskQuestion(), arguments: "heating");
      } else {
        Get.to(InterestedExperts(), arguments: "heating");
      }
    } else if (categoriesList[index] == "Mechanical Enginner") {
      if (controller.myUser.value.mechanical == "") {
        Get.to(AskQuestion(), arguments: "mechanical");
      } else {
        Get.to(InterestedExperts(), arguments: "mechanical");
      }
    } else if (categoriesList[index] == "Psychologist") {
      if (controller.myUser.value.psych == "") {
        Get.to(AskQuestion(), arguments: "psych");
      } else {
        Get.to(InterestedExperts(), arguments: "psych");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // childAspectRatio: (1 / 1),
      ),
      itemBuilder: (context, index) {
        // Container(height: 20, child: Image.asset('assets/images/icons/doctor.png', fit: BoxFit.cover,)),
        return GestureDetector(
          onTap: () {
            gridHandler(index);
          },
          child: Container(
            // height: MediaQuery.of(context).size.height*0.2,
            padding: index == 0 || index == 1
                ? const EdgeInsets.only(top: 10.0, left: 4, right: 4, bottom: 4)
                : const EdgeInsets.all(4.0),
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              // elevation: 18,
              color: Colors.blue[600],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height:
                          categoriesList[index] == "Heating & cooling Engineer"
                              ? (MediaQuery.of(context).size.height) * 0.13
                              : (MediaQuery.of(context).size.height) * 0.14,
                      padding: EdgeInsets.only(top: 4),
                      child: Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              categoriesListIconss[index],
                              fit: BoxFit.contain,
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width * 0.3,
                            )),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        gridHandler(index);
                      },
                      child: Text(
                        categoriesList[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: categoriesList[index] ==
                                  "Heating & cooling Engineer"
                              ? AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 18)
                              : AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 18),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: categoriesList.length,
    );
    // children: transactions.map((tx) {}).toList(),    replace tx with transactions[index]
  }
}

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}