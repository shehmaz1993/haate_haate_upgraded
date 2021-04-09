import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haate_haate/Home.dart';
import 'package:haate_haate/messages.dart';
import 'package:haate_haate/profile.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int i=0;
  var pages = [
    new Home(),
    new Messages(),
    new Profile(),
    //new NotificationsPage()
  ];
  var v= Container(
    //width: 60,
   // height: 60,
    child:Image.asset('assets/images/sign_in_bg.png',),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
        topLeft: Radius.circular(40.0),
        bottomLeft: Radius.circular(40.0)),
    )
  );

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title:Text('Welcome!')),
      bottomNavigationBar: new BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey[800],
        selectedItemColor: Color.fromRGBO(10, 135, 255, 1),
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.message_outlined),
            title: new Text('Messages'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('Profile'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.view_column_outlined),
            title: new Text('More'),
          ),
        ],
        currentIndex: i,

        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            i = index;
          });
        },
      ),
        body:pages.elementAt(i),

    );
  }
}
