import 'package:flutter/material.dart';

class SearchingExpert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search for an expert'),
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
        body: Center(child: SwipeList()));
  }
}

class SwipeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListItemWidget();
  }
}

class ListItemWidget extends State<SwipeList> {
  List experts = expertlst();
  List prices = pricelst();
  List ratings = ratinglst();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: experts.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(experts[index]),
          background: Container(
            alignment: AlignmentDirectional.centerEnd,
            color: Colors.blue,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          onDismissed: (direction) {
            setState(() {
              experts.removeAt(index);
            });
          },
          direction: DismissDirection.endToStart,
          child: Card(
            elevation: 5.0,
            child: Container(
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          topLeft: Radius.circular(5),
                        ),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://cdn4.iconfinder.com/data/icons/instagram-ui-twotone/48/Paul-18-512.png"))),
                  ),
                  Container(
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextButton(
                            child: Text(
                              experts[index],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {},
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Container(
                              width: 260,
                              child: Text(ratings[index]),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(9, 10, 0, 0),
                            child: Container(
                              width: 260,
                              child: Text(prices[index]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }

  static List expertlst() {
    List list = List.generate(10, (i) {
      return "Expert ${i + 1}";
    });
    return list;
  }

  static List pricelst() {
    List list = List.generate(10, (i) {
      return "Price:  ${i + 1}";
    });
    return list;
  }

  static List ratinglst() {
    List list = List.generate(10, (i) {
      return "Rating ${i + 1}";
    });
    return list;
  }
}
