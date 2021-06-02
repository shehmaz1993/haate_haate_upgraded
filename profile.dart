import 'dart:io' ;
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'loadingpage.dart';
import 'package:haate_haate/scannercamera.dart';
import 'dart:ui';

import 'dart:io' as Io ;
import 'scannercamera.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flushbar/flushbar_route.dart' as route;
import 'package:flushbar/flushbar.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';



class Profile extends StatefulWidget {



  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {




 // File scannedDocument,_image;
  Uint8List nid_front_pic,nid_back_pic,birth_pic;
  var nid_front, nid_back, brn_pic;
  //var filelist=[];



  List listItem=['NID','Birth certificate'];
  String selected_value=' ';
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _personName = TextEditingController();
  TextEditingController _nationalIdNumber = TextEditingController();
  TextEditingController _birthCertificateNumber = TextEditingController();
  TextEditingController _birthdayDate = TextEditingController();
  TextEditingController _eMail = TextEditingController();
  TextEditingController _date = new TextEditingController();

  // final _controller = CalendarController();
  final dateFormat = DateFormat('yyyy-MM-dd');
  DateTime _chosenDate = DateTime.now();
  String formatted=' ';
  String nid_front_state='nid_front_search';
  String nid_back_state='nid_back_search';
  String brn_state='brn_pic_search';
  String name,nid_number;

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
  // declare a global dictionary here



  Future <Uint8List> convertingToByte(File fn)async{
    File image= Io.File(fn.path);
    List<int> imageBytes = image.readAsBytesSync();
    //String base64Image = BASE64.encode(imageBytes);
    //nid_pic_as_byte= await .readAsBytesSync();
    return imageBytes;


  }
  Future showFlushbar(Flushbar instance, BuildContext context) {
    final _route = route.showFlushbar(
      context: context,
      flushbar: instance,
    );

    return Navigator.of(context, rootNavigator: true).push(_route);
  }





  birth_container(BuildContext context) => Column(
    children: [
    Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
      child: Container(
      width:600,
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
            controller: _birthCertificateNumber,
            decoration: const InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.confirmation_number_outlined),
              hintText: 'Enter Birth certificate number',
              labelText: 'Birth certificate number',

            ),
          ),
        ),
  ),
  ),
  Padding(
  padding: const EdgeInsets.fromLTRB(40.0, 8.0, 40.0, 8.0),
  child: Container(
  width: 500,
  height: 150,
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
    child:Column(
      children: [
        Container(
          height:25.0,

          child:Padding(
            padding: const EdgeInsets.only(top:4.0),
            child: Text('Birth Certificate picture'),
          ),
        ),
        Container(
            height:98,
            child:(brn_pic!=null && (brn_state=='brn_pic_found')) ?

            Image.file(brn_pic)

                : null
        ),
        Container(
          color: Colors.white,
          height:26,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5.0,2.0,5.0,2.0),
            child: IconButton(
              onPressed:()async{
                setState(() {
                  brn_pic=null;
                  brn_state='brn_pic_search';

                });
                if(brn_state=='brn_pic_search' && brn_pic==null){

                  brn_pic = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScannerCamera()),


                  );
                  setState(() {
                    brn_state='brn_pic_found';
                  });



                }




              },
              icon: Padding(
                padding: EdgeInsets.fromLTRB(5.0,0.0,5.0,5.0),
                child: Icon(Icons.camera_alt),
              ),
              iconSize: 20,

            ),
          ),

        )

      ],
    )
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
          border: InputBorder.none,
          hintText: 'NID number',
          labelText: 'NID',
        ),
        onChanged: (value){
          nid_number=value;
        },
        onSaved: (value){
          nid_number=value;
        },
      ),
    ),
  ),
  ),
       SizedBox(height:15.0),
       Row(
         children: [
           Padding(
             padding: const EdgeInsets.fromLTRB(10.0, 2.0, 3.0, 2.0),
             child: Container(
               width: 153,
               height: 150,
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

               child:Column(
                 children: [
                   Container(
                    height:25.0,

                     child:Padding(
                       padding: const EdgeInsets.only(top:4.0),
                       child: Text('NID picture for  front'),
                     ),
                   ),
                   Container(
                     height:95,
                     child:(nid_front!=null && (nid_front_state=='nid_front_found')) ?

                     Image.file(nid_front)

                         : null
                   ),
                   Container(
                     color: Colors.white,
                     height:26,
                     child: Padding(
                       padding: const EdgeInsets.fromLTRB(5.0,2.0,5.0,2.0),
                       child: IconButton(
                         onPressed:()async{
                                setState(() {
                                  nid_front=null;
                                  nid_front_state='nid_front_search';

                                });
                           if(nid_front_state=='nid_front_search' && nid_front==null){

                             nid_front = await Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => ScannerCamera()),


                             );
                             setState(() {
                               nid_front_state='nid_front_found';
                             });



                           }



                           print('nid_front is ${nid_front.runtimeType}');
                         },
                         icon: Padding(
                           padding: EdgeInsets.fromLTRB(0.0,2.0,5.0,5.0),
                           child: Icon(Icons.camera_alt),
                         ),
                         iconSize: 20,

                       ),
                     ),

                   )
                 ],
               )


             ),
           ),

           //SizedBox(height:2.0),
           Container(
               width: 153,
               height: 150,
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

               child:Column(
                 children: [
                   Container(
                     height:25.0,

                     child:Padding(
                       padding: const EdgeInsets.only(top:4.0),

                       child: Text('NID picture for back'),
                     ),
                   ),
                   Container(
                       height:95,
                     //width: 50,
                     child:(nid_back!=null && nid_back_state=='nid_back_found') ?
                     // nid_back= widget.scannedDocument_pass,
                     Image.file(nid_back,)
                     //Nid back pic
                         :null
                   ),
                   Container(
                     height: 25,
                     color:Colors.white,
                     child: IconButton(
                       onPressed:()async{
                         setState(() {
                           nid_back=null;
                           nid_back_state='nid_back_search';

                         });
                         if(nid_back_state=='nid_back_search'){

                           nid_back = await Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => ScannerCamera()
                               )
                           );
                           setState(() {
                             nid_back_state='nid_back_found';
                           });
                         }
                       },
                       icon: Padding(
                         padding: EdgeInsets.fromLTRB(0.0,2.0,5.0,2.0),
                         child: Icon(Icons.camera_alt),
                       ),
                       iconSize: 20,

                     ),


                   )
                 ],
               )
             ),


         ],
       )

     ],

  );


    void updateProfile()async{

    String body;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    final prefsMap = Map<String, dynamic>();

    String token =  prefs.getString('token');

    String _phonenumber = prefs.getString('username');

    print('token is: ${token}');

    Map<dynamic, dynamic> profile_verification_data = {
      'username': _phonenumber,
      'fullname': name,
      'dateOfBirth':formatted,
      'verificationType': selected_value,
    };

   if(selected_value=='NID'){
     nid_front_pic = await convertingToByte(nid_front);
     nid_back_pic = await convertingToByte(nid_back);
     Map nid = {

     'nid':{
             'national_id': nid_number,
             'nid_pic_front': nid_front_pic,
             'nid_pic_back': nid_back_pic,

           }

     };
     Map<dynamic, dynamic> profile_verification_nid = {};
     profile_verification_nid.addAll(profile_verification_data);
     profile_verification_nid.addAll(nid);
     //print('profile varification nid ${profile_verification_nid}');
     //Merge Data nid
     body = json.encode(profile_verification_nid.toString());
   }
   else if(selected_value=='Birth certificate') {
   //  birth_pic = await convertingToByte(widget.nid_front);
     Map brn = {
       'brn':{
         "birthRegistrationNo": _birthCertificateNumber,
         "brnPicture": birth_pic,
            }
     };

     Map<dynamic, dynamic> profile_verification_brn = {};
     //Merge Data Brn
     profile_verification_brn.addAll(brn);
     profile_verification_brn.addAll(profile_verification_data);
     body = json.encode(profile_verification_brn);

   }

    Map<String, String> headers = {"Content-type": "application/json",
    'Authorization': token};
   print('Checking body :${body} ');
    final response = await http.post(
        'https://103.232.100.173:8080/user/verification/nid-brn',
        headers: headers,
        body: body);

    //print('status code is ${response.statusCode}');

    while (response.statusCode == null){

      print('into if loop ${response.statusCode}');

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Load();

      })
      );
    }
    if (response.statusCode == 200) {

      print('verification api calling is successsful......');
      final Map user_info = json.decode(response.body);
      print(user_info);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        prefs.setString('Profile_Verified','True');
        print("saved successfully");


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
                      child: Padding(
                        padding: const EdgeInsets.only(left:78.0,bottom: 5.0),
                        child: Text('Update Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0),),
                      ),
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
                  SizedBox(height:5.0 ,),
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
                          onChanged: (value){
                            name=value;
                          },
                          onSaved: (value){
                            name=value;
                          },
                        ),

                      ),
                    ),
                  ),
                   SizedBox(height:5.0 ,),
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

                          child: GestureDetector(
                            onTap: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,

                                  minTime: DateTime(1950, 3, 5),
                                  maxTime: DateTime(DateTime.now().year-10,12,31),
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
                                      _date.value = TextEditingValue(text: formatted.toString());
                                    });
                                  },
                                  //currentTime: DateTime.now(),
                                  locale: LocaleType.en);
                            },
                            child: AbsorbPointer(
                              child: TextFormField(
                                controller: _date,
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  hintText: 'Date of Birth',
                                  prefixIcon: Icon(
                                    Icons.dialpad,
                                    // color: _icon,
                                  ),
                                ),
                              ),
                            ),
                          ),
                              /*child: (formatted!=null)?Text(
                            '${formatted}',
                            style: TextStyle(color: Colors.black),
                          ):Text('DOB'),*/


                    ),
                  ),
                  ),
                  SizedBox(height:5.0 ,),
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
                  SizedBox(height:5.0 ,),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Text('Please select verification type',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18,color: Colors.black),),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 8.0, 170.0, 8.0),
                    child: Container(
                      width: 20,
                      height: 40,
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
                      child: DropdownButton(
                        focusColor: Colors.red[100],
                        hint: Padding(
                          padding: const EdgeInsets.only(left:18.0),
                          child:selected_value != ' '?Text(selected_value,style: TextStyle(fontWeight: FontWeight.bold),): Text('Select',style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        //icon: Icon(Icons.),
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
                             child: Padding(
                               padding: const EdgeInsets.only(left:18.0),
                               child: Text(valueitem),
                             ));
                       }).toList(),

                      ),

                    ),
                  ),
                  SizedBox(height:5.0 ,),
                  selected_value=='NID' ? nID_container(context):birth_container(context),
                  SizedBox(height:5.0 ,),

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
                      child:MaterialButton(
                        color: Colors.red,
                        child:Text('Submit',style: TextStyle(color: Colors.white),) ,
                          onPressed: ()async{


                            updateProfile();
                           // await showFlushbar(success_flushbar, context);
                          }

                      )
                    ),
                  ),
                /*  MaterialButton(
                      color: Colors.brown,

                      onPressed: ()async{
                        String body;
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        String token=loadSharedPrefs('key3');
                        String _phonenumber=loadSharedPrefs('key1');
                        print('token is: ${token}');

                        if(selected_value=='NID') {
                          nid_front_pic = await convertingToByte(nid_front);
                          nid_back_pic = await convertingToByte(nid_back);

                          Map<String, dynamic> profile_verification_data = {
                            'username': _phonenumber,
                            'fullname':_personName,
                            'dateOfBirth':formatted,
                            'verificationType': selected_value,
                            'nid':{
                              'nid': _nationalIdNumber,
                              'nid_pic_front': nid_front_pic,
                              'nid_pic_back': nid_back_pic,
                            }
                          };

                          body = json.encode(profile_verification_data);
                        }
                        else if(selected_value=='Birth certificate') {
                          //  birth_pic = await convertingToByte(widget.nid_front);
                          Map brn = {

                            "birthRegistrationNo": _birthCertificateNumber,
                            "brnPicture": birth_pic,
                          };

                          Map<String, dynamic> profile_verification_brn = {
                            'username': _phonenumber,
                            'fullname':_personName,
                            'dateOfBirth':formatted,
                            'verificationType': selected_value,
                            'brn':{
                              "birthRegistrationNo": _birthCertificateNumber,
                              "brnPicture": birth_pic,
                            }
                          };
                          //Merge Data Brn
                       //   profile_verification_brn.addAll(brn);
                         // profile_verification_brn.addAll(profile_verification_data);
                          body = json.encode(profile_verification_brn);
                          //

                        }
                        print('Checking body : ${body}');
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
                          print('user_info is ${user_info} ');
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

                  })*/



                ],
              ),

          ),
        ),
      ) ,
    );
  }

}
