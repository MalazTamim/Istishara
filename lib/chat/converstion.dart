import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/chat/messages.dart';
import 'package:firebase_app/chat/new_message.dart';
import 'package:firebase_app/pages/RateMe.dart';
import 'package:firebase_app/pages/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_bar/rating_bar.dart';

class Converstion extends StatefulWidget {
  String me;
  String other;
  Converstion({this.me, this.other});
  @override
  _ConverstionState createState() => _ConverstionState(me: me, other: other);
}

class _ConverstionState extends State<Converstion> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("on open messageeeeeeeeeeeeeeeee");
    });
    final FirebaseMessaging fcm = FirebaseMessaging.instance;
    fcm.getToken().then((token) {
      //print("siiiiiiiiiiiiiiiiii  " + token);
      FirebaseFirestore.instance.collection("tokens").add({"token": token});
    });

    getToken();
  }

  String token;
  getToken() async {
    String t = await FirebaseMessaging.instance.getToken();
    await FirebaseFirestore.instance
        .collection("tokens")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({'token': t});
  }

  String me;
  String other;
  _ConverstionState({this.me, this.other});

  Future<String> getImage() async {
    final x = await FirebaseFirestore.instance
        .collection("users")
        .where("name", isEqualTo: other)
        .get();
    final l = x.docs;
    final d = l.first;
    var url = d.data()["imageURL"];
    return (url);
  }

  UserController controller = Get.put(UserController());

  double x; //x=controller.myUser.value.ratingList
  String name1;

  RateMeDialogp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RatingBar(
                  onRatingChanged: (rating) => setState(() => x = rating),
                  filledIcon: Icons.star,
                  emptyIcon: Icons.star_border,
                  halfFilledIcon: Icons.star_half,
                  isHalfAllowed: true,
                  filledColor: Colors.yellow[700],
                  emptyColor: Colors.yellow[700],
                  halfFilledColor: Colors.yellow[700],
                  size: 30,
                ),
                // Container(
                //   margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                //   height: 45,
                //   width: 100,
                //   decoration: BoxDecoration(
                //       color: Colors.blue,
                // borderRadius: BorderRadius.circular(20)),
                // child: FlatButton(
                //     onPressed: () async {
                //       var data = await FirebaseFirestore.instance
                //           .collection("users")
                //           .where("name", isEqualTo: name1)
                //           .limit(1)
                //           .get();
                //       var y = data.docs;
                //       for (var expert in y) {
                //         var ex = expert.data();
                //         var old = ex["rating"];
                //         print("hahahahahhahahahahahaha");
                //         double n;
                //         if (old == 0)
                //           n = x;
                //         else
                //           n = (old + x) / 2;
                //         var uid = ex["uid"];
                //         print(old);
                //         print(n);
                //         await FirebaseFirestore.instance
                //             .collection("users")
                //             .doc(uid)
                //             .update({"rating": n});
                //         // Get.back();
                //         Navigator.of(context).pop();
                //       }
                //       Navigator.of(context).pop();
                //     },
                //     child: Text("Submit", style: TextStyle(color: Colors.white)),
                // onPressed: () {
                //   Navigator.of(context).pop();
                // },
                // ),
                // )
              ],
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
                onPressed: () async {
                  // Navigator.of(context).pop();
                  var data = await FirebaseFirestore.instance
                      .collection("users")
                      .where("name", isEqualTo: name1)
                      .limit(1)
                      .get();
                  var y = data.docs;
                  for (var expert in y) {
                    var ex = expert.data();
                    var old = ex["rating"];
                    print("hahahahahhahahahahahaha");
                    double n;
                    if (old == 0)
                      n = x;
                    else
                      n = (old + x) / 2;
                    var uid = ex["uid"];
                    print(old);
                    print(n);
                    await FirebaseFirestore.instance
                        .collection("users")
                        .doc(uid)
                        .update({"rating": n});
                    // Get.back();
                    // Navigator.of(context).pop();
                  }
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FutureBuilder<String>(
            future: getImage(),
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == "")
                  return CircleAvatar(
                      backgroundImage:
                          AssetImage("assets\\blank-profile-picture"));
                else
                  return Column(children: [
                    Container(
                        padding: EdgeInsets.fromLTRB(5, 13, 3, 2),
                        child: CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data)))
                  ]);
              } else {
                return CircularProgressIndicator();
              }
            }),
        leadingWidth: 40,
        title: Row(
          children: <Widget>[
            Text("$other"),
            SizedBox(width: 73),
            controller.myUser.value.type == "expert"
                ? Container()
                : TextButton(
                    child: Text("Rate Me",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    onPressed: () {
                      Get.to(RateMe(name: other));
                      // RateMeDialogp(context);
                    },
                  )
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(child: Messages(me: me, other: other)),
            NewMessage(me: me, other: other)
          ],
        ),
      ),
    );
  }
}
