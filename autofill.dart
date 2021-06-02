import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:haate_haate/sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flushbar/flushbar_route.dart' as route;
import 'package:flushbar/flushbar.dart';
import 'loadingpage.dart';




class SmsVerification extends StatefulWidget {
 // final String username1;
 // final String otp1;
//  final String password1;
  final String username_o;
  final String otp_o;
  final String password_o;

  //SmsVerification({Key key,@required this.username1,@required this.password1,@required this.otp1}) : super(key: key);
 SmsVerification({ this.username_o,this.otp_o,this.password_o});

  @override
  _SmsVerificationState createState() => _SmsVerificationState();
}

class _SmsVerificationState extends State<SmsVerification> {

   final dataList=[];
   String otp_completed='false';


   final Flushbar success_flushbar = Flushbar(message: 'Successfully registered!',backgroundColor: Colors.green,flushbarPosition: FlushbarPosition.BOTTOM,
     flushbarStyle: FlushbarStyle.FLOATING,isDismissible: false, duration: Duration(seconds: 5),reverseAnimationCurve: Curves.decelerate,
     forwardAnimationCurve: Curves.elasticOut,);

  SharedPreferences sharedPreferences;
  String registered_username;
  String registered_password;
  String token;
  String profile_verification='false';


 @override
   void initState() {

    // TODO: implement initState
    super.initState();

  }
  var key1;
  var key2;
  var hey3;
   Future showFlushbar(Flushbar instance, BuildContext context) {
     final _route = route.showFlushbar(
       context: context,
       flushbar: instance,
     );

     return Navigator.of(context, rootNavigator: true).push(_route);
   }

   //shared preference.......
    var otp_by_user=' ';



   loadSharedPrefs(String key)async{
     switch(key){
       case "key1":{

         SharedPreferences prefs = await SharedPreferences.getInstance();
         String v=prefs.getString("key1")??' ';
         return v;
       }
       break;
       case "key2":{
         SharedPreferences prefs = await SharedPreferences.getInstance();
         String v=prefs.getString("key2")??' ';
         return v;
       }
       break;
       case "key3":{
         SharedPreferences prefs = await SharedPreferences.getInstance();
         String v=prefs.getString("key3")??' ';
         return v;
       }
     }

   }



    void verifyuser() async{
      Map data = {
        'username': widget.username_o,
        'is_phone_verified':'false',
        'otp': otp_by_user
      };
      String body = json.encode(data);
      Map<String, String> headers = {"Content-type": "application/json"};

      final response = await http.post(
          'https://haatehaate.herokuapp.com/api/v1/user/registration/phase-2/',
          headers: headers,
          body: body);

      while (response.statusCode== null){

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Load();
        })
        );
      }

      if (response.statusCode == 200) {
        print('api calling is successsful......');
        final Map user_info_otp = json.decode(response.body);
        print(user_info_otp);
        registered_username = user_info_otp["success_response"]["username"];
        registered_password = widget.password_o;
        token = user_info_otp["success_response"]["token"];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', registered_username );
        prefs.setString('password', registered_password );
        prefs.setString('token', token );
        prefs.setString('Profile_Verified', 'False');

        Route route =MaterialPageRoute(builder: (context)=>SignIn());
        Navigator.push(context,route);

    }
   else {
   print('api calling error .........');
   }





  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Text("We have sent SMS to: ", style:TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
                    SizedBox(height: 15,),
                    Text(widget.username_o),
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:50.0,horizontal:40 ),
                child: Container(
                  child:OTPTextField(
                    
                    length: 5,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 50,
                    fieldStyle: FieldStyle.box,
                    style: TextStyle(
                        fontSize: 17
                    ),
                    onChanged: (pin) {
                      print("Changed: " + pin);
                      otp_by_user=pin;
                    },
                    onCompleted: (pin) {
                      print("Completed: " + pin);
                     setState(() {
                       otp_by_user=pin;
                       otp_completed='true';
                     });
                    },
                  ),
                  ),
                ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical:10.0,horizontal:40 ),
                 child: SizedBox(


                     child: MaterialButton(
                       color:Colors.red,
                       onPressed: otp_by_user!=' '?(){
                         Navigator.push(context, MaterialPageRoute(builder: (context) {
                           return Load();
                         })
                         );
                         verifyuser();
                       }:null,
                       child:  Text('Verify',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold))




                       )
                 )
               ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('Did not receive a code?'),
                  SizedBox(width: 2.5,),
                  InkWell(
                      onTap: ()async{
                        Map data = {
                          'username': widget.username_o,
                          'send_otp': 'true',
                        };

                        String body = json.encode(data);
                        Map<String, String> headers = {"Content-type": "application/json"};
                        final response = await http.post(
                            'https://haatehaate.herokuapp.com/api/v1/user/registration/send-otp-for-registration/',
                            headers: headers,
                            body: body);
                        if (response.statusCode == 200) {
                          print('api calling is successsful......');
                          final Map user_info = json.decode(response.body);
                          print(user_info);

                          setState(() {
                           registered_username = user_info["pending_response"]["sms"]["username"];
                            registered_password = user_info["pending_response"]["sms"]["otp"];

                          });
                        } else {
                          print('api calling error .........');
                        }

                      },
                      child: Text('Resend',style: TextStyle(color: Colors.red),)


                  ),
                ],
              )

            ],
          ),

    );
  }
}
