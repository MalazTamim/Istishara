import 'package:firebase_app/chat/contacts.dart';
import 'package:firebase_app/chat/converstion.dart';
import 'package:firebase_app/pages/PostingQuestion.dart';
import 'package:firebase_app/pages/ask_question.dart';
import 'package:firebase_app/pages/user_controller.dart';
import 'package:firebase_app/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../grid/list_of_categories.dart';
import '../grid/list_of_categories.dart';
import 'ClientProfile.dart';
import 'myQuestions.dart';

class navController extends GetxController {
  final _selectedIndex = 0.obs;
  get selectedIndex => this._selectedIndex.value;
  set selectedIndex(index) => this._selectedIndex.value = index;
}

class navigationClient extends StatelessWidget {
  final UserController controller = Get.put(UserController());

  
  @override
  Widget build(BuildContext ctx) {
    controller.getUser() ; 
    final navController navcontrol = Get.put(navController());
    final List<Widget> bodyContent = [
      ListCategories(),
      Search(),
      // Converstion(),
      Contacts(),
      // Contacts(),
      
      myProfile(),

      // put here all pages you need
    ];
    return Scaffold(
      body: Obx(
        () => Center(
          child: bodyContent.elementAt(navcontrol.selectedIndex),
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(ctx).size.height*0.1,
        width: MediaQuery.of(ctx).size.width,
        child: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.blue),
                label: "Home",
              ),
               BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.blue),
                label: "Search",
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
      ),
    );
  }
}

/*GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: mainNavigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: navigationClient(),
    );
  }
}

class navigationClient extends StatefulWidget {
  navigationClient({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _navigationClientState createState() => _navigationClientState();
}

class _navigationClientState extends State<navigationClient> {
  Page _page = Page('Page 0');
  int _currentIndex = 0;

  // Custom navigator takes a global key if you want to access the
  // navigator from outside it's widget tree subtree
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        onTap: (index) {
          // here we used the navigator key to pop the stack to get back to our
          // main page
          navigatorKey.currentState.maybePop();
          setState(() => _page = Page('Page $index'));
          _currentIndex = index;
        },
        currentIndex: _currentIndex,
      ),
      body: CustomNavigator(
        navigatorKey: navigatorKey,
        home: _page,
        //Specify your page route [PageRoutes.materialPageRoute] or [PageRoutes.cupertinoPageRoute]
        pageRoute: PageRoutes.materialPageRoute,
      ),
    );
  }

  final _items = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home), label: "home", title: Text("listCategories")),
    BottomNavigationBarItem(
        icon: Icon(Icons.search), label: "Search", title: Text("search")),
    BottomNavigationBarItem(
        icon: Icon(Icons.library_books),
        label: "My Questions",
        title: Text("myQuestions")),
    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: "My Profile",
        title: Text("myProfile")),
  ];
}

class Page extends StatelessWidget {
  final String title;

  const Page(this.title) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    final text = Text(title);

    return Container(
      child: Center(
          child: FlatButton(
              onPressed: () => _openDetailsPage(context), child: text)),
    );
  }

  //Use the navigator like you usually do with .of(context) method
  _openDetailsPage(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => DetailsPage(title)));

//  _openDetailsPage(BuildContext context) => mainNavigatorKey.currentState.push(MaterialPageRoute(builder: (context) => DetailsPage(title)));

}

class DetailsPage extends StatelessWidget {
  final String title;

  const DetailsPage(this.title) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    final text = Text('Details of $title');
    return Container(
      child: Center(child: text),
    );
  }
}
*/

/*class navigationClient extends StatefulWidget {
  @override
  _navigationClientState createState() => _navigationClientState();
}

class _navigationClientState extends State<navigationClient> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffold: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.library_books),
              label: "My Questions",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              label: "My Profile",
            ),
          ],
        ),
      ),
      children: <Widget>[
        ListCategories(),
        search(),
        myQuestions(),
        myProfile(),
      ],
    );
  }
}
*/

/*class navigationClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final navController navcontrol = Get.put(navController());

    return CustomScaffold(
      scaffold: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.library_books),
              label: "My Questions",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              label: "My Profile",
            ),
          ],
        ),
      ),
      children: <Widget>[
        ListCategories(),
        search(),
        myQuestions(),
        myProfile(),
      ],
    );
  }
}*/
