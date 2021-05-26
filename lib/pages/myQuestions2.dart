import 'package:flutter/material.dart';

class MyClass extends StatelessWidget {
  List questions = myquestionlst();
  List fields = fieldlst();
  List bides = bidelst();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Questions"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text(questions[1] + "\n" + "\n"),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(children: <Widget>[
                              Icon(Icons.widgets),
                              Text("   " + fields[2]),
                            ]),
                            Container(
                              margin: const EdgeInsets.only(top: 5.0),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.account_box_outlined),
                                TextButton(
                                  child: Text(
                                    bides[2],
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                enabled: true,
              ),
              Divider(color: Colors.black),
              ListTile(
                title: Text(questions[1] + "\n" + "\n"),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(children: <Widget>[
                              Icon(Icons.widgets),
                              Text("   " + fields[2]),
                            ]),
                            Container(
                              margin: const EdgeInsets.only(top: 5.0),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.account_box_outlined),
                                TextButton(
                                  child: Text(
                                    bides[2],
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                enabled: true,
              ),
              Divider(color: Colors.black),
              ListTile(
                title: Text(questions[1] + "\n" + "\n"),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(children: <Widget>[
                              Icon(Icons.widgets),
                              Text("   " + fields[2]),
                            ]),
                            Container(
                              margin: const EdgeInsets.only(top: 5.0),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.account_box_outlined),
                                TextButton(
                                  child: Text(
                                    bides[2],
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                enabled: true,
              ),
              Divider(color: Colors.black),
              ListTile(
                title: Text(questions[1] + "\n" + "\n"),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(children: <Widget>[
                              Icon(Icons.widgets),
                              Text("   " + fields[2]),
                            ]),
                            Container(
                              margin: const EdgeInsets.only(top: 5.0),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.account_box_outlined),
                                TextButton(
                                  child: Text(
                                    bides[2],
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                enabled: true,
              ),
              Divider(color: Colors.black),
            ],
          ),
        ));
  }

  static List myquestionlst() {
    List list = List.generate(10, (i) {
      return "Question ${i + 1}";
    });
    return list;
  }

  static List fieldlst() {
    List list = List.generate(10, (i) {
      return "Field ${i + 1}";
    });
    return list;
  }

  static List bidelst() {
    List list = List.generate(10, (i) {
      return "${i + 1} bides";
    });
    return list;
  }
}
