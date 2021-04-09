import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title:Text('Welcome!')),

      body:
      Padding(
        padding: const EdgeInsets.only(top:18.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:14.0,left: 5.0),
                child:  ListTile(
                  title: Text('John Doe',style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle:Text('Dhanmondi 4/A Dhaka') ,
                  trailing: Icon(Icons.edit),
                  leading: v,
                ),
              ),
              Padding(
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
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(top:15.0),
                child: Container(child: Text('Select your Role',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20.0))),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:40.0,top: 50.0),
                    child: GestureDetector(
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 170,
                            child:Image.asset('assets/images/sign_in_bg.png',),

                          ),
                          Container(
                            height: 30,
                            width: 170,
                            padding: EdgeInsets.only(left:50.0),
                            child:Text('Sender'),
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
                      onTap: (){

                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0,top: 50.0),
                    child: GestureDetector(
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 170,
                            child:Image.asset('assets/images/sign_in_bg.png',),

                          ),
                          Container(
                            height: 30,
                            width: 170,
                            padding: EdgeInsets.only(left:50.0),
                            child:Text('Carrier'),
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
