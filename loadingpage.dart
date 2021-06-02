import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'autofill.dart';
class Load extends StatefulWidget {
  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {

  startTime() async {
    var _duration = new Duration(seconds: 15);
    return new Timer(_duration,navigationPage);
  }
  void navigationPage() {
    Route route =MaterialPageRoute(builder: (context)=>SmsVerification(

    ));
    Navigator.push(context,route);
  }
  @override
  void initState() {
   // super.initState();
    //startTime();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SpinKitRing(
                  color: Colors.red,
                  size: 50.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('Loading....',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 20.0),)
              ],
            )
        ),
    );
  }
}
