import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:haate_haate/sign_up.dart';
import 'package:http/http.dart' as http;

import 'Size.dart';
import 'homepage.dart';
import 'loadingpage.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  int _currentIndex = 0;

  String fetched_token;
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);
  }
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _password = TextEditingController();
  var formkey = GlobalKey<FormState>();




  void TempLoginSys() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString("username");
    String password = prefs.getString("password");

    if(username==_phonenumber.text && password==_password.text){


      Route route =MaterialPageRoute(builder: (context)=>HomePage());
      Navigator.push(context,route);
      print("successful login");
    }

  }



  void logInByUser()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String  username = prefs.getString("username");
    String password = prefs.getString("password");
    String token = prefs.getString("token");


    Map data = {
      'username': _phonenumber,

      'password': _password,
    };

    String body = json.encode(data);
    Map<String, String> headers = {"Content-type": "application/json"};
    final response = await http.post(
        'https://haatehaate.herokuapp.com/api/v1/user/registration/phase-2/',
        headers: headers,
        body: body);

    while (response.statusCode == null){

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Load();
      })
      );
    }

    if (response.statusCode == 200) {
      print('api calling is successsful......');
     final Map user_info_otp = json.decode(response.body);
      print(user_info_otp);
      String message = user_info_otp["message"];
      if (message == 'True'){
        Route route =MaterialPageRoute(builder: (context)=>HomePage());
        Navigator.push(context,route);
        print("successful login");


      }


    } else {
      print('api calling error .........');
    }
  }
  var countrydropdown= Container(
    decoration: new BoxDecoration(
      color: Colors.white70,

      border: Border(
        right: BorderSide(width: 0.5, color: Colors.grey),

      ),
    ),
    height: 45.0,
    margin: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 0.8,
        left: SizeConfig.blockSizeHorizontal * 2.5),
    child: Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 1.2,
          left: SizeConfig.blockSizeHorizontal * 0.5),
      child: Text('+88', style: TextStyle(color: Colors.black, fontSize: 15)),
    ),
  );


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(

        body: ListView(
          children:<Widget>[
           Stack(
                children: [
                  Image.asset('assets/images/sign_in_bg.png',width: 500,),
                  Padding(
                     padding: EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*5.00,top: SizeConfig.blockSizeVertical*38.00,right:SizeConfig.blockSizeHorizontal*5.00,),//left: 20.00,top: 270.00,right:10.0

                      child:Container(

                         // color:Colors.white,
                          decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color: Colors.white,
                              boxShadow: [
                                new BoxShadow(
                                  blurRadius: 2.0,
                                  offset: const Offset(3.0, 2.0),
                                  color: Colors.grey,
                                ),
                                new BoxShadow(
                                  blurRadius: 2.0,
                                  offset: const Offset(-3.0, 0.0),
                                  color: Colors.grey,
                                )
                              ]
                          ),
                        child:Padding(
                          padding:  EdgeInsets.all(6.0),
                          child: Form(
                            key: formkey,
                            child: Column(

                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*4.0,top:SizeConfig.blockSizeVertical*0.8),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text('Sign In',style: TextStyle(color: Colors.black,fontSize: 20.0, ),textAlign: TextAlign.center,),
                                          SizedBox(height:SizeConfig.blockSizeVertical*0.90,),//6
                                          Container(
                                            height:SizeConfig.blockSizeVertical*0.84,
                                            width:SizeConfig.blockSizeHorizontal*30,
                                            color: Colors.red,
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*18.8,bottom:SizeConfig.blockSizeVertical*1.2),//left:80.0,bottom: 9.0
                                        child: InkWell(
                                          onTap: (){
                                            Route route=MaterialPageRoute(builder: (context)=> SignUp());

                                            Navigator.push((context), route);
                                          },
                                            child: Text('Sign up',textAlign:TextAlign.right,style: TextStyle(color: Colors.grey[300],fontSize: 20.0, ))

                                        ),
                                      ),
                                    ],

                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  margin: new EdgeInsets.only(
                                      top: 10.0,
                                      bottom: 10.0,
                                      right: 3.0,
                                      left: 10.0),
                                  color: Colors.white,
                                  child: TextFormField(
                                    controller: _phonenumber,
                                    maxLength: 11,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Phone number',
                                      fillColor: Colors.white,
                                      prefixIcon: countrydropdown,
                                      hintText: 'Phone Number',
                                    ),
                                    validator: (value) {
                                      if (value.length == 0) {
                                        return ("Phone number must required");
                                      }
                                      if (value.length != 11) {
                                        return ("Enter valid Phone number");
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {},
                                  ),
                                ),
                                SizedBox(
                                  height:SizeConfig.blockSizeVertical* 1.0,
                                  width:SizeConfig.blockSizeHorizontal* 2.0,
                                ),
                                Container(
                                  width: double.infinity,
                                  margin: new EdgeInsets.only(
                                      top: 10.0,
                                      bottom: 10.0,
                                      right: 3.0,
                                      left: 10.0),
                                  color: Colors.white,
                                  child: TextFormField(
                                    controller: _password,
                                    obscureText: true,

                                    //keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Password',
                                      fillColor: Colors.white,
                                      prefixIcon: Icon(Icons.lock),
                                      hintText: 'Password',
                                    ),
                                    validator: (value) {
                                      if (value.length == 0) {
                                        return ("Password must required");
                                      }
                                     /* if (value.length != 11) {
                                        return ("Enter correct password");
                                      }*/
                                      return null;
                                    },
                                    onSaved: (value) {},
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left:SizeConfig.blockSizeHorizontal* 34.00,top:SizeConfig.blockSizeVertical*10.0),//left: 110.00,top:60.00,
                                  child: Text('Forgot your password?',style: TextStyle(color: Colors.black,fontSize: 15.0,fontStyle:FontStyle.italic ),textAlign: TextAlign.right,),
                                ),
                                SizedBox(height:SizeConfig.blockSizeVertical* 2,),//height: 7,
                                SizedBox(
                                  height:SizeConfig.blockSizeVertical* 9.0,//60.0
                                  width:SizeConfig.blockSizeHorizontal* 89.0,//290.0
                                  child: MaterialButton(
                                      color:Colors.red ,
                                      child:Text('SIGN IN',style: TextStyle(color: Colors.white70,fontSize:20.0,fontWeight: FontWeight.bold ),),
                                      onPressed:()async{
                                        if (formkey.currentState.validate()){
                                          //logInByUser();
                                          TempLoginSys();
                                        }




                                      }
                                  ),
                                ),
                                SizedBox(height:SizeConfig.blockSizeVertical* 0.5,),
                              ],
                            ),
                          ),
                        )

                      )
                 ),


                ],

                ),
            Padding(
              padding: EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*8.0,top:SizeConfig.blockSizeVertical* 8.0,right:SizeConfig.blockSizeHorizontal* 4.0),//left:25.0,top: 50.0,right: 4.0
              child: Row(
                  children: [
                    Text('*I agree with  terms and condition',textAlign:TextAlign.center,style: TextStyle(color:Colors.grey ),),
                    SizedBox(width: 5,),
                    Text('Read more',style:TextStyle(color: Colors.black)),
                  ],
                ),
            ),

            ]
    ),

        );

  }

}
