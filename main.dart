import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haate_haate/Home.dart';
import 'package:haate_haate/alert.dart';
import 'package:haate_haate/autofill.dart';
import 'package:haate_haate/datetimepicker.dart';
import 'package:haate_haate/loadingpage.dart';
import 'package:haate_haate/profile.dart';
import 'package:haate_haate/senderpage.dart';
import 'package:haate_haate/sign_in.dart';





import 'package:haate_haate/sign_up.dart';
import 'package:haate_haate/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:haate_haate/google_map.dart';
import 'location_provider.dart';




void main() {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown])
      .then((_) {

    runApp(MyApp());
  });

}
class MyApp extends StatelessWidget {
  //const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context)=>LocationProvider(),
          child: MapShow(),

        )
      ],
      child: new MaterialApp(

        debugShowCheckedModeBanner: false,
        home:new SplashScreen(),
       /* routes:  <String, WidgetBuilder>{
          //'SignUp': (BuildContext context) => new SignUp(),
          //'CheckConnection': (BuildContext context) => new CheckConnection(),
          'SignUp': (BuildContext context) => new SignUp(),
        },*/
      ),
    )
    ;
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}