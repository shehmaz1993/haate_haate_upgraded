import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haate_haate/no_internet_connectionPage.dart';

import 'package:connectivity/connectivity.dart';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flushbar/flushbar_route.dart' as route;
import 'package:flushbar/flushbar.dart';
import 'package:overlay_support/overlay_support.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  final Flushbar fail_flushbar = Flushbar(message: 'You are not connected to Internet',backgroundColor: Colors.red,flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,isDismissible: false, duration: Duration(seconds: 5),reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,);
  final Flushbar success_flushbar = Flushbar(message: 'You are  connected to Internet',backgroundColor: Colors.green,flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,isDismissible: false, duration: Duration(seconds: 5),reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,);
  final Connectivity _connectivity = Connectivity();
  Future<bool> isInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network, make sure there is actually a net connection.
      if (await DataConnectionChecker().hasConnection) {

        // Mobile data detected & internet connection confirmed.
        await showFlushbar(success_flushbar, context);
        return true;
      } else {
        // Mobile data detected but no internet connection found.
        await showFlushbar(fail_flushbar, context);
        return false;
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a WIFI network, make sure there is actually a net connection.
      if (await DataConnectionChecker().hasConnection) {
        // Wifi detected & internet connection confirmed.
       await showFlushbar(success_flushbar, context);
        return true;
      } else {
        // Wifi detected but no internet connection found.
       await showFlushbar(fail_flushbar, context);
        return false;
      }
    } else {
      // Neither mobile data or WIFI detected, not internet connection found.
      showFlushbar(fail_flushbar, context);
      return false;
    }
  }

  startTime() async {
    var _duration = new Duration(seconds: 10);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage()async {
    var v=await isInternet();
    if(v==true)
   {

     Navigator.of(context).pushReplacementNamed('SignUp');
   }
    else
     {
       Navigator.push(context, MaterialPageRoute(builder: (context) {
         return NoInternetConnectionPage();

       }
    ));
     }
  }
  Future showFlushbar(Flushbar instance, BuildContext context) {
    final _route = route.showFlushbar(
      context: context,
      flushbar: instance,
    );

    return Navigator.of(context, rootNavigator: true).push(_route);
  }

  @override
  void initState() {
    super.initState();
    startTime();
    SystemChrome.setEnabledSystemUIOverlays([]);

  }
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: new Scaffold(
          body: Container(

            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/splash_screen.png"),
                fit: BoxFit.fill,
              ),
            ),

          )

      ),
    );

  }

}

