import 'dart:io' ;
import 'dart:typed_data';
import 'package:haate_haate/FileAddnotifier.dart';
import 'package:haate_haate/Home.dart';
import 'package:haate_haate/homepage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:haate_haate/scannercamera.dart';
//import 'package:image/image.dart';
import 'package:provider/provider.dart';
import 'dart:io' as Io ;
import 'scannercamera.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flushbar/flushbar_route.dart' as route;
import 'package:flushbar/flushbar.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:document_scanner/document_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

// declare a global dictionary here

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

class Profile extends StatefulWidget {
 final File scanneddocument_pass;



  Profile({Key key,@required this.scanneddocument_pass}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


   File scanneddocument_pass_front=null;

   File scanneddocument_pass_back;

 // File scannedDocument,_image;
  Uint8List nid_front_pic,nid_back_pic,birth_pic;
  File nid_front, nid_back, brn_pic,font,back;
  //var filelist=[];



  List listItem=['NID','Birth certificate'];
  String selected_value='NID';
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _personName = TextEditingController();
  TextEditingController _nationalIdNumber = TextEditingController();
  TextEditingController _birthCertificateNumber = TextEditingController();
  TextEditingController _birthdayDate = TextEditingController();
  TextEditingController _eMail = TextEditingController();
 // final _controller = CalendarController();
  final dateFormat = DateFormat('yyyy-MM-dd');
  DateTime _chosenDate = DateTime.now();
  String formatted;

  var nid_pic_as_byte;
  final Flushbar success_flushbar = Flushbar(message: 'profile Verification successful!',backgroundColor: Colors.green,flushbarPosition: FlushbarPosition.BOTTOM,
    flushbarStyle: FlushbarStyle.FLOATING,isDismissible: false, duration: Duration(seconds: 5),reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,);

  @override
  void initState() {

    super.initState();
   // getVaule(widget.scannedDocument_pass);
    //filelist.add(widget.scannedDocument_pass);

  }

 /* void nid_fontfn(context){
  gotoCamera(context);
    nid_front=widget.scannedDocument_pass;
  }
  void nid_backfn(context){
    gotoCamera(context);
    nid_back=widget.scannedDocument_pass;
  }*/



  Future <Uint8List> convertingToByte(File fn)async{
    File image=fn;
    print('path is ${image.path}');

    nid_pic_as_byte= await Io.File(image.path).readAsBytesSync();
    return nid_pic_as_byte;


  }
  Future showFlushbar(Flushbar instance, BuildContext context) {
    final _route = route.showFlushbar(
      context: context,
      flushbar: instance,
    );

    return Navigator.of(context, rootNavigator: true).push(_route);
  }



  /*void getVaule( File file){
    if(nid_front==null)
     {
       nid_front=widget.scannedDocument_pass;
       print('nid back is ${nid_front.runtimeType}');
      // return nid_front;
     }
    else if(nid_front==null && nid_back==null){
      nid_back=widget.scannedDocument_pass;
      print('nid back is ${nid_back.runtimeType}');
    }
    
  }*/

  birth_container(BuildContext context) => Column(
    children: [
  Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
      child: Container(
      width:double.infinity,
        height: 59,
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
  ]),
        child: Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: TextFormField(
            controller: _birthCertificateNumber,
            decoration: const InputDecoration(
              icon: Icon(Icons.confirmation_number_outlined),
              hintText: 'Enter Birth certificate number',
              labelText: 'Birth certificate number',

            ),
          ),
        ),
  ),
  ),
  Padding(
  padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
  child: Container(
  width: 600,
  height: 100,
  decoration: new BoxDecoration(
  borderRadius: BorderRadius.circular(7.0),
  color: Colors.white24,
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
  ]),
    child:widget.scanneddocument_pass!=null?
        Image.file(widget.scanneddocument_pass)

        :IconButton(
      icon: Center(
        child: Icon(Icons.camera_alt),
      ),
      iconSize: 20,
      onPressed:(){
       // gotoCamera(context);
      },
    ),
  ),
  )
    ],
  );
   nID_container(BuildContext context)=>Column(
     children: [
   Padding(
   padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
  child: Container(
  width: 600,
  height: 59.1,
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
  ]),
    child: Padding(
      padding: const EdgeInsets.only(left:8.0),
      child: TextFormField(
        controller: _nationalIdNumber,
        decoration: const InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'NID number',
          labelText: 'NID',
        ),
      ),
    ),
  ),
  ),
  Padding(
  padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
  child: Container(
  width: 600,
  height: 100,
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
  ]),

  child:
     widget.scanneddocument_pass!=null?

    Image.file(widget.scanneddocument_pass)

      : IconButton(
  icon: Center(
  child: Icon(Icons.camera_alt),
  ),
  iconSize: 20,
  onPressed:(){
    gotoCamera(context);





  },
  ),

  ),
  ),


       Padding(
         padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
         child: Container(
           width: 600,
           height: 100,
           decoration: new BoxDecoration(
               borderRadius: BorderRadius.circular(7.0),
               color: Colors.white24,
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
               ]),

           child:widget.scanneddocument_pass!=null?
            // nid_back= widget.scannedDocument_pass,
           Image.file(widget.scanneddocument_pass)
            //Nid back pic
               :IconButton(
             icon: Center(
               child: Icon(Icons.camera_alt),
             ),
             iconSize: 20,
             onPressed:(){
              gotoCamera(context);
              //nid_backfn(context);
               //camerafuntion(context);
             },
           ),
         ),
       ),
     ],

  );

  gotoCamera( BuildContext context){

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
      return ScannerCamera();
      //  return
      }),
    );
  }

  void updateProfile()async{
    String body;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token=loadSharedPrefs('key3');
    String _phonenumber=loadSharedPrefs('key1');
    print('token is: ${token}');

    Map profile_verification_data = {
      'username': _phonenumber,
      'fullname':_personName,
      'dateOfBirth':formatted,
      'verificationType': selected_value,
    };

   if(selected_value=='NID') {
   //  nid_front_pic = await convertingToByte(widget.nid_front);
    // nid_back_pic = await convertingToByte(widget.nid_front);
     Map nid = {

       'natioal_id': _nationalIdNumber,
       'nid_pic_front': nid_front_pic,
       'nid_pic_back': nid_back_pic,

     };
     Map<String, dynamic> profile_verification_nid = {};
     profile_verification_nid.addAll(profile_verification_data);
     profile_verification_nid.addAll(nid);
     //Merge Data nid
     body = json.encode(profile_verification_nid);
   }
   else if(selected_value=='NID') {
   //  birth_pic = await convertingToByte(widget.nid_front);
     Map brn = {
       "birthRegistrationNo": _birthCertificateNumber,
       "brnPicture": birth_pic,
     };

     Map<String, dynamic> profile_verification_brn = {};
     //Merge Data Brn
     profile_verification_brn.addAll(brn);
     body = json.encode(profile_verification_brn);

   }

    Map<String, String> headers = {"Content-type": "application/json",
    'Authorization': token};
   print('Checking body :${body}');
    final response = await http.post(
        'http://103.232.100.173:8080/user/verification/nid-brn',
        headers: headers,
        body: body);
    if (response.statusCode == 200) {
      print('verification api calling is successsful......');
      final Map user_info = json.decode(response.body);
      print(user_info);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        prefs.setString('Profile_verification','true');
        print("save successfully");


      });

    }
    else {
      print('verification api calling error .........');
    }

   }

     /*
     String body = json.encode(profile_verification_nid);
     Map<String, String> headers = {"Content-type": "application/json"};
     final response = await http.post(
         'https://haatehaate.herokuapp.com/api/v1/user/registration/phase-2/',
         headers: headers,
         body: body);
     if (response.statusCode == 200) {
       print('api calling is successsful......');
       final Map user_info = json.decode(response.body);
       print(user_info);
       SharedPreferences prefs = await SharedPreferences.getInstance();
       setState(() {

         prefs.setString('Profile_verification','true');
         print("save successfully");


       });


     } else {
       print('api calling error .........');
     }
   }
   else{
     birth_pic=await convertingToByte(widget.scannedDocument_pass);
      Map data = {
        'natioal_id':_nationalIdNumber,
        'nid_pic_front':nid_front_pic,
        'nid_pic_back':nid_back_pic,

      };
     {
       "username": "019xxxxxxx",
    "fullname": "John Doe",
    "dateOfBirth": "yyyy-MM-dd",
    "verificationType": "NID/BRN",

    nid: {
    "nid": "1234567890", (10, 13, 17)
    "nidCardFront": byte[],
    "nidCardBack": byte[]
    },

    brn: {
    "birthRegistrationNo": "12345678901234567", (17)
    "brnPicture": byte[]
    }
    }




      String body = json.encode(data);
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await http.post(
          'http://103.232.100.173:8080/user/nid/verification/nid-brn',
          headers: headers,
          body: body);
      if (response.statusCode == 200) {
        print('api calling is successsful......');
        final Map user_info = json.decode(response.body);
        print(user_info);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        setState(() {

          prefs.setString('Profile_verification','true');
          print("save successfully");


        });


      } else {
        print('api calling error .........');
      }
    }


  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Padding(
        padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
        child: Container(
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
              ]),
          child: Form(
            child:ListView(
              //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Padding(
                      padding: const EdgeInsets.only(left:8.0,),
                      child: Text('Update Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0),),
                    ),
                /*   Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
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
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: TextFormField(
                            controller: _phonenumber,

                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.person),
                              hintText: '01912682712',
                              labelText: 'Phone Number ',
                            ),
                          ),
                        ),
                      ),
                    ),*/
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
                    child: Container(
                      width: double.infinity,
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
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),

                        child: TextFormField(
                          controller: _personName,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.child_care),
                            hintText: 'Enter full name',
                            labelText: 'Name',
                          ),
                        ),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
                    child: Container(
                      width: double.infinity,
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
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left:2.0),

                          child:TextButton(

                              onPressed: () {
                                DatePicker.showDatePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime(1950, 3, 5),
                                    maxTime: DateTime.now(),
                                    onChanged: (date) {
                                      print('change $date');
                                     setState(() {
                                       _chosenDate=date;
                                     });
                                    }, onConfirm: (date) {
                                      print('confirm $date');
                                      setState(() {

                                        _chosenDate=date;
                                         formatted = dateFormat.format(date);
                                        print(formatted);
                                      });
                                    },
                                    //currentTime: DateTime.now(),
                                    locale: LocaleType.en);
                              },
                              child: (formatted!=null)?Text(
                            '${formatted}',
                            style: TextStyle(color: Colors.black),
                          ):Text('DOB'),

                      ),
                    ),
                  ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
                    child: Container(
                      width: double.infinity,
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
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: TextFormField(
                          controller: _eMail,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.email),
                            hintText: 'Enter Email',
                            labelText: 'Email ',
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Text('NID/Birth Certificate:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.brown),),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 8.0, 170.0, 8.0),
                    child: Container(
                      width: 20,
                      height: 40,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: Colors.red[100],
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
                          ]),
                      child: DropdownButton(
                        hint: Padding(
                          padding: const EdgeInsets.only(left:18.0),
                          child: Text('Select',style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        icon: Icon(Icons.arrow_downward_rounded),
                        iconSize: 30,
                        elevation: 2,
                        isExpanded: true,
                        onChanged:(newvalue) {
                          setState(() {
                            selected_value=newvalue;

                          });
                        },
                       items: listItem.map((valueitem) {
                         return DropdownMenuItem(
                             value: valueitem,
                             child: Text(valueitem));
                       }).toList(),

                      ),

                    ),
                  ),
                  selected_value=='NID' ? nID_container(context):birth_container(context),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
                    child: Container(
                      width: 600,
                      height: 50,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: Colors.redAccent,
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
                          ]),
                      child:ElevatedButton(
                        child:Text('Submit') ,
                          onPressed: ()async{
                            updateProfile();
                            await showFlushbar(success_flushbar, context);
                          }

                      )
                    ),
                  ),

                  MaterialButton(onPressed: ()async{
                   // File f= await createFileOfImageUrl();
                  //  print(f.runtimeType);
                  //  File image=widget.scannedDocument_pass;
                  //  print('path is ${image.path}');

                  //  final nidpicasbyte= await Io.File(image.path).readAsBytesSync();
                   // print(nidpicasbyte.runtimeType);
                  })

                ],
              ),

          ),
        ),
      ) ,
    );
  }

}
