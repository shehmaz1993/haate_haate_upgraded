import 'dart:io';

import 'package:flutter/material.dart';

import 'package:haate_haate/scannercamera.dart';

import 'scannercamera.dart';


class Profile extends StatefulWidget {
  final File scannedDocument_pass;

  Profile({Key key,@required this.scannedDocument_pass}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  File scannedDocument,_image;

  bool isCameraPermissionAccepted;
  List listItem=['NID','Birth certificate'];
  String selected_value='NID';

   List list=[];


  @override
  void initState() {

    super.initState();
  }



  birth_container(BuildContext context) => Padding(
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

    ),
  );
   nID_container(BuildContext context)=>Column(
     children: [
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
             child:widget.scannedDocument_pass!=null? Image.file(widget.scannedDocument_pass)

                 :IconButton(
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
           child:widget.scannedDocument_pass!=null? Image.file(widget.scannedDocument_pass):IconButton(
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
     ],

  );

  gotoCamera( BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return ScannerCamera();
      }),
    );
  }

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
                    Padding(
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
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              hintText: '01912682712',
                              labelText: 'Phone Number ',
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
                        padding: const EdgeInsets.only(left:8.0),

                          child: TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.child_care),
                              hintText: '13-10-1994',
                              labelText: 'Date of birth ',
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
                        padding: const EdgeInsets.only(left:8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
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

                      )
                    ),
                  ),



                ],
              ),

          ),
        ),
      ) ,
    );
  }
}
