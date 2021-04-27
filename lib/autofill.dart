import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:haate_haate/sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flushbar/flushbar_route.dart' as route;
import 'package:flushbar/flushbar.dart';
import 'usermodel.dart';



class SmsVerification extends StatefulWidget {
  final String username1;
  final String otp1;
  final String password1;

   SmsVerification({Key key,@required this.username1,@required this.password1,@required this.otp1}) : super(key: key);
 // SmsVerification({ this.username1,this.otp1,this.password1,this.confirmpassword});

  @override
  _SmsVerificationState createState() => _SmsVerificationState();
}

class _SmsVerificationState extends State<SmsVerification> {

   final dataList=[];

  User user;
   final Flushbar success_flushbar = Flushbar(message: 'Successfully registered!',backgroundColor: Colors.green,flushbarPosition: FlushbarPosition.BOTTOM,
     flushbarStyle: FlushbarStyle.FLOATING,isDismissible: false, duration: Duration(seconds: 5),reverseAnimationCurve: Curves.decelerate,
     forwardAnimationCurve: Curves.elasticOut,);

  SharedPreferences sharedPreferences;
  String registered_username;
  String registered_password;
  String token;
  String profile_verification='false';
  User _user=User();

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

    saveSharedPrefs(String key)async{
     switch(key){
       case "key1":{

         SharedPreferences prefs = await SharedPreferences.getInstance();
       setState(() {
         prefs.setString('key1',registered_username );

         print("save successfully");
       });
       }
       break;
       case "key2":{
         SharedPreferences prefs = await SharedPreferences.getInstance();
       setState(() {
         prefs.setString('key2',registered_password);

         print("save successfully");
         //dataList.add(registered_password);
       });
         print(json.encode(registered_password));
       }
       break;
       case "key3":{
         SharedPreferences prefs = await SharedPreferences.getInstance();
        setState(() {
          prefs.setString('key3',token );
          print("save successfully");
          //dataList.add(token);
        });

         print(json.encode(token));
       }
       break;
       case "Profile_verification":{
         SharedPreferences prefs = await SharedPreferences.getInstance();
         setState(() {
           prefs.setString('Profile_verification',profile_verification );
           print("save successfully");
           //dataList.add(token);
         });

       }

     }
   }

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
  Map data1;


   void createuser2()async{
    Map data = {
      'username': widget.username1,
      'is_phone_verified':'false',
      'otp': widget.otp1
    };
    String body = json.encode(data);
    Map<String, String> headers = {"Content-type": "application/json"};
    final response = await http.post(
        'https://haatehaate.herokuapp.com/api/v1/user/registration/phase-2/',
        headers: headers,
        body: body);
    if (response.statusCode == 200) {
      print('api calling is successsful......');
      final Map user_info_otp = json.decode(response.body);
      print(user_info_otp);
      setState(() {
        registered_username=user_info_otp["success_response"]["username"];
        registered_password=widget.password1;
        token=user_info_otp["success_response"]["token"];
        saveSharedPrefs("key1");
        saveSharedPrefs("key2");
        saveSharedPrefs("key3");
        data1 = {
          'username': registered_username,
          'password': registered_password,

          'token':token
        };
        Route route =MaterialPageRoute(builder: (context)=>SignIn());
        Navigator.push(context,route);

      });


     // print(registered_username);
    //  print("details is ${data1.toString()}");

    //  print("lets print ${_user.username.toString()}");


    //  String got_result=await loadSharedPrefs("key1");
     // print(got_result);

   /*   if(got_result==' '){
        saveSharedPrefs("key1");
        saveSharedPrefs("key2");
        saveSharedPrefs("key3");
       await showFlushbar(success_flushbar, context);
        Route route =MaterialPageRoute(builder: (context)=>SignIn());
             Navigator.push(context,route);
      } */

      print(dataList);


    } else {
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
                    Text(widget.username1),
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
                      otp_by_user=pin;
                    },
                  ),
                  ),
                ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical:10.0,horizontal:40 ),
                 child: SizedBox(
                   width:double.infinity,
                   child: RaisedButton(
                       child: Text('Verify',style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)),

                       onPressed: ()async{
                          // print(widget.username1);
                         await createuser2();
                         String got_result=await loadSharedPrefs("key1");


                   }),
                 ),
               ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('Did not receive a code?'),
                  SizedBox(width: 2.5,),
                  InkWell(
                      onTap: ()async{
                        Map data = {
                          'username': widget.username1,
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
