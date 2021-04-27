import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haate_haate/FileAddnotifier.dart';
import 'package:haate_haate/Home.dart';
import 'package:haate_haate/homepage.dart';
import 'package:haate_haate/profile.dart';

import 'package:haate_haate/scannercamera.dart';
import 'package:haate_haate/senderpage.dart';

import 'package:haate_haate/sign_up.dart';
import 'package:haate_haate/splashscreen.dart';

import 'checkinginternetconnection.dart';
import 'package:provider/provider.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown])
      .then((_) {

    runApp( new MaterialApp(


        debugShowCheckedModeBanner: false,
        home:Profile(),//Sender()//HomePage(),//new SplashScreen(),

   /* routes:  <String, WidgetBuilder>{
          //'SignUp': (BuildContext context) => new SignUp(),
        //'CheckConnection': (BuildContext context) => new CheckConnection(),
        'SignUp': (BuildContext context) => new SignUp(),
        },*/
      ),

    );
  });

}
