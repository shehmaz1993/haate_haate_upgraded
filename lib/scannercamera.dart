import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:io' as Io ;
import 'package:document_scanner/document_scanner.dart';
import 'package:haate_haate/FileAddnotifier.dart';
import 'package:haate_haate/profile.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
//import 'package:image/image.dart';


 class ScannerCamera extends StatefulWidget {

   @override
   _ScannerCameraState createState() => _ScannerCameraState();
 }

 class _ScannerCameraState extends State<ScannerCamera> {
   List<File> task=[];
   File scannedDocument,nid_font,nid_back;

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
                   scannedDocument != null
                       ? Positioned(
                     bottom: 80,
                     left: 0,
                     right: 0,
                     child: RaisedButton(
                         child: Text("Save"),
                         onPressed: () async{

                          // print('FileType is ${scannedDocument.runtimeType}');
                          // var  pic_as_byte=convertingToByte(scannedDocument);
                          // print('FileType is ${pic_as_byte.runtimeType}');
                         //  Provider.of<FileAddNotifier>(context).addFile(pic_as_byte);
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context)
                               => Profile(scanneddocument_pass: scannedDocument)

                             ),
                           );

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
   Future <Uint8List> convertingToByte(File fn)async{
     File image=fn;
     Uint8List pic_as_byte;
     print('path is ${image.path}');

     pic_as_byte= await Io.File(image.path).readAsBytesSync();
     return pic_as_byte;


   }
 }

