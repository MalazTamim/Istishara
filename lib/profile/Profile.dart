import 'editProfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:rating_dialog/rating_dialog.dart';
import 'package:firebase_app/pages/AnsweredQuestionsList.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:firebase_app/pages/user_controller.dart';



class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  UserController controller = Get.put(UserController());
  
  Widget _buildChip(String label, Color color) {
    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      // avatar: CircleAvatar(
      //   backgroundColor: Colors.white70,
      //   child: Text(label[0].toUpperCase()),
      // ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    // List<double> rate = [5, 4.5, 5.0, 3.5];

    // var mean = rate.reduce((a, b) => a + b) / rate.length;

    
    // final skillsListWidget =
    //     Padding(padding: EdgeInsets.all(4), child: SkillsList(m.questionsList));

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            new Stack(children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/back.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                   padding:  EdgeInsets.only(
                     top: MediaQuery.of(context).size.height * 0.1,
                        bottom: 11,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07
                     
                     ),
                
                   child: CircleAvatar(
                     child: Padding(
                    padding: const EdgeInsets.only(top: 85, left: 100),
                  
                    ),
                  radius: MediaQuery.of(context).size.width * 0.2,
                  backgroundImage: NetworkImage(controller.myUser.value.imageURL),
                  backgroundColor: Colors.blue,
                ),
              ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.2,
                        // left: MediaQuery.of(context).size.width * 0.02,
                        right: MediaQuery.of(context).size.width * 0.04,
                        bottom: MediaQuery.of(context).size.height * 0.02),
                        child: Row(
                          children: <Widget>[
                            // Text(
                            //   "Rating: ",
                            //   style: TextStyle(
                            //       color: Colors.black,
                            //       fontWeight: FontWeight.bold,
                            //       fontSize: 23),
                            // ),
                            // double x = controller.myUser.value.rating;
                            RatingBar.readOnly(
                              filledColor: Colors.yellow[700],
                              emptyColor: Colors.yellow[700],
                              halfFilledColor: Colors.yellow[700],
                              initialRating: controller.myUser.value.rating,
                              //  == null ? 4 : controller.myUser.value.rating.toDouble() ,
                              isHalfAllowed: true,
                              halfFilledIcon: Icons.star_half,
                              filledIcon: Icons.star,
                              emptyIcon: Icons.star_border,
                              size: MediaQuery.of(context).size.width * 0.070,
                            ),
                          ],
                        ),
                      ),
                   
                ],


              ),
            ]),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14.0, bottom: 18.0),
                  child: Text(
                    controller.myUser.value.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                ),
                // RatingBar(ratingWidget: ratingWidget, onRatingUpdate: onRatingUpdate),
              ],
            ),

            Container(
              padding: EdgeInsets.only(left:14),
              child: Text(
                      "My skills",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
            ),

            Container(
              padding: EdgeInsets.only(left: 6, bottom: 16),
              child: Wrap(
                spacing: 6.0,
                runSpacing: 6.0,
                children: <Widget>[
                  controller.myUser.value.skill1=="" ? Container() : _buildChip(controller.myUser.value.skill1, Color(0xFFff6666)),
                  controller.myUser.value.skill2=="" ? Container() : _buildChip(controller.myUser.value.skill2, Color(0xFF007f5c)),
                  controller.myUser.value.skill3=="" ? Container() : _buildChip(controller.myUser.value.skill3, Color(0xFF5f65d3)),
                  controller.myUser.value.skill4=="" ? Container() : _buildChip(controller.myUser.value.skill4, Color(0xFF19ca21)),
                  controller.myUser.value.skill5=="" ? Container() : _buildChip(controller.myUser.value.skill5, Color(0xFF60230b)),
                  controller.myUser.value.skill6=="" ? Container() : _buildChip(controller.myUser.value.skill6, Color(0xFF16B2DA)),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 12.0),
            //   child: RatingBar.builder(
            //     initialRating: 4.5,
            //     minRating: 0,
            //     direction: Axis.horizontal,
            //     allowHalfRating: true,
            //     itemCount: 5,
            //     itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            //     itemBuilder: (context, _) => Icon(
            //       Icons.star,
            //       color: Colors.amber,
            //     ),
            //     onRatingUpdate: (rating) {
            //       print(rating);
            //     },
            //   ),
            // ),
            //
            //
            //
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
            //   child: Row(
            //     children: <Widget>[
            //       Text(
            //         "Rating: ",
            //         style: TextStyle(
            //             color: Colors.black,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 23),
            //       ),
            //       RatingBar.readOnly(
            //         filledColor: Colors.yellow[700],
            //         emptyColor: Colors.yellow[700],
            //         halfFilledColor: Colors.yellow[700],
            //         initialRating: mean,
            //         isHalfAllowed: true,
            //         halfFilledIcon: Icons.star_half,
            //         filledIcon: Icons.star,
            //         emptyIcon: Icons.star_border,
            //       ),
            //     ],
            //   ),
            // ),

            // Row(
            //   children: [
            // Padding(
            //   padding: const EdgeInsets.only(left: 19.0, top: 19),
            //   child: Text(
            //     "Price range per question:",
            //     style: TextStyle(
            //         color: Colors.black,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 17),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 6.0, top: 19),
            //   child: Text(
            //     m.price,
            //     style: TextStyle(
            //         color: Colors.black,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 17),
            //   ),
            // ),
            //   ],
            // ),
            // Row(children: [
            //   Padding(
            //     padding: const EdgeInsets.only(left: 8.0, top: 12),
            //     child: Container(
            //       decoration: BoxDecoration(
            //           color: Colors.blue,
            //           borderRadius: BorderRadius.circular(4)),
            //       child: FlatButton(
            //           onPressed: () {},
            //           child: Text(
            //             'Profile',
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //                 color: Colors.black,
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 17),
            //           )),
            //     ),
            //   ),
            //   Padding(
            //     padding: const EdgeInsets.only(top: 12, right: 8),
            //     child: Container(
            //       decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(4)),
            //       child: FlatButton(
            //           onPressed: () {},
            //           child: Text(
            //             'Previous Answered Questions',
            //             style: TextStyle(
            //                 color: Colors.black,
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 15),
            //           )),
            //     ),
            //   ),
            // ]),

            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 12.0),
              child: Text(
                'About',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 23),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 12.0),
              child: Text(
                controller.myUser.value.about,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(top: 4, left: 18.0, bottom: 0.0),
            //   child: Text(
            //     'Answered questions History',
            //     style: TextStyle(
            //         color: Colors.black,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 19),
            //   ),
            // ),

            // m.questionsList == null
            //     ? "No Question Answered yet"
            //     : skillsListWidget,
            
            
            // ListTile(
            //       title: Text("Become a Pro member"),)

            // ListView(
            //       physics: BouncingScrollPhysics(),
            //       children: [
            //         SkillsList(skillslst)],
            //       )
            // 
            Container(
              padding: EdgeInsets.only(left:20,right: 20,top: 10,bottom: 10),
              width: double.infinity,
              height: 70,
              child: MaterialButton(
                child: Text("Edit Profile", style:TextStyle(fontSize: 21,color: Colors.white)),
                color: Colors.blue,
                onPressed: () {
                  Get.off(
                          editProfile(),
                          // arguments: m,
                        );
                },
              ),
            ),
            // controller.myUser.value.skill1==""? Container() : Text(controller.myUser.value.skill1,style: TextStyle(fontWeight: FontWeight.bold)),
            // controller.myUser.value.skill2==""? Container() : Text(controller.myUser.value.skill2,style: TextStyle(fontWeight: FontWeight.bold)),
            // controller.myUser.value.skill3==""? Container() : Text(controller.myUser.value.skill3,style: TextStyle(fontWeight: FontWeight.bold)),
            // controller.myUser.value.skill4==""? Container() : Text(controller.myUser.value.skill4,style: TextStyle(fontWeight: FontWeight.bold)),
            // controller.myUser.value.skill5==""? Container() : Text(controller.myUser.value.skill5,style: TextStyle(fontWeight: FontWeight.bold)),
            // controller.myUser.value.skill6==""? Container() : Text(controller.myUser.value.skill6,style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}