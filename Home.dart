import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haate_haate/senderpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Size.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


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
    /*decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
         // image: NetworkImage('assets/images/sign_in_bg.png',),
          fit: BoxFit.fill
      ),
    ),*/
  );
  String username;
  SharedPreferences sharedPrefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    SharedPreferences.getInstance().then((prefs) {
      setState(() => sharedPrefs = prefs);
    });

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // appBar: AppBar(title:Text('Welcome!')),

      body:
      Padding(
        padding:  EdgeInsets.only(top:SizeConfig.blockSizeVertical*2.8),//18.0
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(top:SizeConfig.blockSizeVertical*3.4,left:SizeConfig.blockSizeHorizontal*1.5),//top:14.0,left: 5.0
                child:  ListTile(
                  title: Text(sharedPrefs.getString("username"), style: TextStyle(fontWeight: FontWeight.bold),),
               //   subtitle:Text('Dhanmondi 4/A Dhaka') ,
                  // trailing: Icon(Icons.edit),
                  leading: v,
                ),
              ),
            /*  Padding(
                padding: const EdgeInsets.only(top:8.0,right: 15.0,left: 15.0),
                child: Container(
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      color: Colors.white,
                      boxShadow: [
                        new BoxShadow(
                          blurRadius: 2.0,
                          offset: const Offset(3.0, 0.0),
                          color: Colors.grey,
                        ),
                        new BoxShadow(
                          blurRadius: 2.0,
                          offset: const Offset(-3.0, 0.0),
                          color: Colors.grey,
                        )
                      ]),

                  child: TextField(
                      decoration: InputDecoration(
                        /* enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),*/
                          hintText: "address",
                          prefixIcon: Icon(Icons.location_pin)
                      )),
                ),
              ),*/
              SizedBox(height:SizeConfig.blockSizeVertical* 10,),//10.0
              Padding(
                padding:  EdgeInsets.only(top:SizeConfig.blockSizeVertical*1.5,left: SizeConfig.blockSizeHorizontal*10.0,right: SizeConfig.blockSizeHorizontal*10.0),//15.0
                child: Container(child: Text('Select your Role',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 24.0))),
              ),
              SizedBox(height:SizeConfig.blockSizeVertical* 6.0,),
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top:SizeConfig.blockSizeVertical*4.4,left:SizeConfig.blockSizeHorizontal*10.0),//left:40.0,top: 50.0
                    child: GestureDetector(
                      child: Container(
                        height:SizeConfig.blockSizeVertical* 21.0,//150
                        width:SizeConfig.blockSizeHorizontal*35.8, //148,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                blurRadius: 2.0,
                                offset: const Offset(3.0, 0.0),
                                color: Colors.grey,
                              ),
                              new BoxShadow(
                                blurRadius: 2.0,
                                offset: const Offset(-3.0, 0.0),
                                color: Colors.grey,
                              )
                            ]),
                        child: Column(
                          children: [
                            Container(
                              height:SizeConfig.blockSizeVertical* 17.0, //120,
                              width:SizeConfig.blockSizeHorizontal*37.8, //170.5,
                              child:Image.asset('assets/images/sign_in_bg.png',),

                            ),
                            Container(
                             // height: 40,
                              width:SizeConfig.blockSizeHorizontal*35.8, //170,
                              padding: EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*10.0,right:SizeConfig.blockSizeHorizontal*10.0,top:SizeConfig.blockSizeVertical* 0.5  ),//50.0
                              child:Text('Sender',style: TextStyle(fontSize:18.0 )),
                              /*   decoration: new BoxDecoration(
                                 // borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    new BoxShadow(
                                      blurRadius: 2.0,
                                      offset: const Offset(0.0, 0.0),
                                      color: Colors.grey,
                                    ),
                                    new BoxShadow(
                                      blurRadius: 2.0,
                                      offset: const Offset(0.0, 0.0),
                                      color: Colors.grey,
                                    )
                                  ]),*/

                            )
                          ],
                        ),
                      ),
                      onTap: ()async{
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        String profile_verification = prefs.getString("Profile_Verified")??' ';
                        if( profile_verification =='True'){
                          Route route =MaterialPageRoute(builder: (context)=>Sender());
                          Navigator.push(context,route);
                        }
                        else{
                          print("Your profile hasn't been verified yet!");
                        }

                      },
                    ),
                  ),
                  SizedBox(width:SizeConfig.blockSizeHorizontal*8.0 ),
                  Padding(
                    padding:  EdgeInsets.only(top:SizeConfig.blockSizeVertical*4.4,right:SizeConfig.blockSizeHorizontal*10.0),
                    child: GestureDetector(
                      child: Container(
                        height:SizeConfig.blockSizeVertical* 21.0,//150
                        width:SizeConfig.blockSizeHorizontal*35.8, //148,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                blurRadius: 2.0,
                                offset: const Offset(3.0, 0.0),
                                color: Colors.grey,
                              ),
                              new BoxShadow(
                                blurRadius: 2.0,
                                offset: const Offset(-3.0, 0.0),
                                color: Colors.grey,
                              )
                            ]),
                        child: Column(
                          children: [
                            Container(
                              height:SizeConfig.blockSizeVertical* 17.0, //120,
                              width:SizeConfig.blockSizeHorizontal*37.8, //170.5,
                              //height: 120,
                              //width: 170.5,
                              child:Image.asset('assets/images/sign_in_bg.png',),

                            ),
                            Container(
                             // height: 30,
                             // width: 170,
                              width:SizeConfig.blockSizeHorizontal*35.8,
                              padding: EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*10.0,right:SizeConfig.blockSizeHorizontal*10.0,top:SizeConfig.blockSizeVertical* 0.5  ),
                              child:Text('Carrier',style: TextStyle(fontSize:18.0 )),
                              /*   decoration: new BoxDecoration(
                                 // borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    new BoxShadow(
                                      blurRadius: 2.0,
                                      offset: const Offset(0.0, 0.0),
                                      color: Colors.grey,
                                    ),
                                    new BoxShadow(
                                      blurRadius: 2.0,
                                      offset: const Offset(0.0, 0.0),
                                      color: Colors.grey,
                                    )
                                  ]),*/

                            )
                          ],
                        ),
                      ),
                      onTap: (){

                      },
                    ),
                  )
                ],
              )
            ]
        ),
      ),
    );
  }
}
