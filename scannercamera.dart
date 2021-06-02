
import 'dart:io';

import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:document_scanner/document_scanner.dart';


import 'package:permission_handler/permission_handler.dart';
//import 'document_scanner.dart';


 class ScannerCamera extends StatefulWidget {

   @override
   _ScannerCameraState createState() => _ScannerCameraState();
 }

 class _ScannerCameraState extends State<ScannerCamera> {
   List<File> task=[];
   File scannedDocument,nid_font,nid_back;
   bool state_v=true;

   Future<PermissionStatus> cameraPermissionFuture;

   @override
   void initState() {
     cameraPermissionFuture = Permission.camera.request();
     super.initState();
   }


   @override
   Widget build(BuildContext context) {

     return Scaffold(
       body:FutureBuilder<PermissionStatus>(
         future: cameraPermissionFuture,
         builder: (BuildContext context,
             AsyncSnapshot<PermissionStatus> snapshot) {
           if (snapshot.connectionState == ConnectionState.done) {
             if (snapshot.data.isGranted)
               return Stack(
                 children: <Widget>[
                   Column(
                     children: <Widget>[
                       Expanded(
                         child: scannedDocument != null
                             ? Image(
                           image: FileImage(scannedDocument),
                         )
                             : DocumentScanner(
                           onDocumentScanned:
                               (ScannedImage scannedImage) {
                             print("document : " +
                                 scannedImage.croppedImage);

                             setState(() {
                               scannedDocument = scannedImage
                                   .getScannedDocumentAsFile();
                               task.add(scannedDocument);
                               // imageLocation = image;
                             });
                           },
                         ),
                       ),
                     ],
                   ),
                   scannedDocument != null
                       ? Positioned(
                     bottom: 20,
                     left: 0,
                     right: 0,
                     child: RaisedButton(
                         child: Text("Retry"),
                         onPressed: () {
                           setState(() {
                             scannedDocument = null;
                           });
                         }),
                   )
                       : Container(),
                   ( scannedDocument != null )
                       ? Positioned(
                     bottom: 80,
                     left: 0,
                     right: 0,
                     child: RaisedButton(
                         child: Text("Save"),
                         onPressed: () async{

                           Navigator.pop(context, scannedDocument);


                         }
                         ),
                   )
                       : Container(),

                 ],
               );
             else
               return Center(
                 child: Text("camera permission denied"),
               );
           } else {
             return Center(
               child: CircularProgressIndicator(),
             );
           }
         },
       )
     );

   }

 }

