import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'location_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:geocoder/geocoder.dart';
class MapShow extends StatefulWidget {
  const MapShow({Key key}) : super(key: key);

  @override
  _MapShowState createState() => _MapShowState();
}

class _MapShowState extends State<MapShow> {
  GoogleMapController _controller;
  Address address;

  //final CameraPosition _initialposition=CameraPosition(target: LatLng(23.777176, 90.399452));
 // final List<Marker> markers=[];
 @override
 void initState(){
   super.initState();
   Provider.of<LocationProvider>(context,listen: false).initialization();
 }
  /*addMarker(cordinate){
    int id=Random().nextInt(100);
    setState(() {

     // markers.add(Marker( position:cordinate,markerId: MarkerId(id.toString())));
    });
  }*/
  getAddressOfLocation()async{


  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        body: googleMapUI()

      
    );
  }
  Widget googleMapUI(){
   return Consumer<LocationProvider>(
    builder: (consumerContext,model,child){
       if(model.locationPosition!=null){
         return Column(
           children: [
             /*Padding(
               padding: const EdgeInsets.fromLTRB(10.0, 50.0, 0.0, 8.0),
               child: Container(
                   width: double.infinity,
                   height: 50,

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
                   child: Row(
                     children: [
                       Container(
                         child:Text(model.first.addressLine.toString())
                       ),
                       Container(
                         child: MaterialButton(
                           child: Text('Confirm'),
                           onPressed: (){
                             Navigator.pop(context,model.first);
                           },
                         ),
                       )
                     ],
                   )
                 ),

             ),*/
             Expanded(
               child: GoogleMap(
                   initialCameraPosition: CameraPosition(
                       target: model.locationPosition,
                       zoom:18
                   ),
                   myLocationEnabled: true,
                   myLocationButtonEnabled: true,
                   mapType: MapType.normal,
                   markers: Set<Marker>.of(model.markers.values),
                   onMapCreated:(controller){
                     _controller=controller;
                   } ,
                   //markers: markers.toSet(),
                   onTap:(locationPosition)async{
                     _controller.animateCamera(CameraUpdate.newLatLng(locationPosition));
                     Navigator.pop(context,model.first);
                   } ,



                 ),
             ),




           ],
         );

       }
       return Container(
         child: Center(
           child: CircularProgressIndicator(),
         ),
       );

    },
   );
  }
}
