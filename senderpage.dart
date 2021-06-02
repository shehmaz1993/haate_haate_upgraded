import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:haate_haate/google_map.dart';
import 'Size.dart';

class Sender extends StatefulWidget {
  @override
  _SenderState createState() => _SenderState();
}

class _SenderState extends State<Sender> {
    Address address;
    String SateOfAddress='search';
    String selected_value='Food';
    String selected_value_of_weight='  ';
    List listItem=['Food','Documents','Gifts','Accessories','Others'];
    List weight=['1 kg','2 kg','3 kg','4 kg','5 kg'];
    @override
    void initState() {
      // TODO: implement initState
      super.initState();

    }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body:Padding(
        padding: EdgeInsets.fromLTRB(15.0, 50.0, 10.0, 0.0),
        child:ListView(
          children: [
           
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

                child:Row(
                  children: [
                    Container(
                      height: 20,
                      width:50,
                      child: Image.asset('assets/images/pin.png'),
                    ),
                    Container(
                      width: 240,
                      child: Flexible(
                        child: SateOfAddress=='found'?Text(address.addressLine.toString())
                        :Text('Enter your Location')
                        /*TextFormField(

                          decoration: const InputDecoration(
                            icon: Padding(
                              padding: EdgeInsets.only(left:8.0),
                              child: Icon(Icons.location_pin),
                            ),
                            hintText: 'Enter location of Sender',
                           border: InputBorder.none
                           // labelText: 'Birth certificate number',

                          ),
                          onChanged: (value){
                            sender_address=value;
                          },
                          onSaved:(value){
                            sender_address=value;
                          } ,
                        ),*/
                      ),

                    ),
                    Container(
                      width: 5,
                      color: Colors.white24,
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: ()async{
                          setState(() {
                            SateOfAddress='search';
                            address=null;
                          });
                         if(SateOfAddress=='search'){
                           address= await Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => MapShow()),


                           );
                           setState(() {
                             SateOfAddress='found';
                           });
                         }
                        },
                      ),
                    ),
                       ],
                )
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

                  child:Row(
                    children: [
                      Container(
                        child: Flexible(
                          child: TextFormField(

                            decoration: const InputDecoration(
                                icon: Padding(
                                  padding: EdgeInsets.only(left:8.0),
                                  child: Icon(Icons.location_pin),
                                ),
                                hintText: 'Enter location of receiver',
                                border: InputBorder.none
                              // labelText: 'Birth certificate number',

                            ),
                          ),
                        ),

                      ),
                      Container(
                        color: Colors.white24,
                        child: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: (){},
                        ),
                      ),
                    ],
                  )
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 0.0),
                child:Container(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                          child: Text('Product Details',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0),),
                        ),
                        SizedBox(height: 2,),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Type',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
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
                                    color: Colors.red,
                                  ),
                                  new BoxShadow(
                                    blurRadius: 2.0,
                                    offset: const Offset(-3.0, 0.0),
                                    color: Colors.red,
                                  )
                                ]),

                              child:Row(
                                children: [
                                  Container(

                                    child:selected_value!=null?Padding(
                                      padding: const EdgeInsets.only(left:14.0,top: 13.0),
                                      child: Text(selected_value,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                                    ):null,
                                    height: 50.0,
                                    width: 190.0,

                                  ),
                                  SizedBox(),
                                  Container(
                                    height: 50,
                                    //color: Colors.brown,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DropdownButton(

                                        focusColor: Colors.red,
                                      /*  hint: Padding(
                                          padding: const EdgeInsets.only(left:38.0),
                                          child: Text('Select',style: TextStyle(fontWeight: FontWeight.bold),),
                                        ),*/
                                        icon: Icon(Icons.arrow_downward_rounded),
                                        elevation: 10,
                                        items: listItem.map((valueitem) {
                                          return DropdownMenuItem(
                                              value: valueitem,
                                              child: Text(valueitem));
                                        }).toList(),
                                        onChanged: (value) {

                                          setState(() {
                                            selected_value=value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ),
                          ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Weight',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
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
                            child: Row(
                              children: [
                                Container(

                                  child:selected_value_of_weight!=null?Padding(
                                    padding: const EdgeInsets.only(left:14.0,top: 13.0),
                                    child: Text(selected_value_of_weight,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                                  ):null,
                                  height: 50.0,
                                  width: 200.0,

                                ),
                                SizedBox(),
                                Container(
                                  height: 50,
                                  //color: Colors.brown,
                                  child: Padding(
                                    padding:  const EdgeInsets.only(left: 60.0),
                                    child: DropdownButton(
                                      focusColor: Colors.red,
                                      /*  hint: Padding(
                                          padding: const EdgeInsets.only(left:38.0),
                                          child: Text('Select',style: TextStyle(fontWeight: FontWeight.bold),),
                                        ),*/
                                      icon: Icon(Icons.arrow_downward_rounded),
                                      elevation: 10,
                                      items: weight.map((valueitem) {
                                        return DropdownMenuItem(
                                            value: valueitem,
                                            child: Text(valueitem));
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selected_value_of_weight=value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            height: 140.0,
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
                                  height: 130,
                                  width:164,
                                  //color: Colors.brown,
                                  decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: Colors.grey,
                                     ),
                                  child: Image.asset('assets/images/ava.png'),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Container(
                                  height: 130,
                                  width:164,
                                 // color: Colors.blueGrey,
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Colors.grey,
                                  ),
                                  child: Image.asset('assets/images/ava.png'),
                                ),
                              ],
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Receiver Info',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0),),
                        ),
                        SizedBox(height: 8,),
                        Padding(
                          padding:  EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                          child: Text('Name',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
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
                                  border: InputBorder.none,

                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Mobile Number',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
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
                               // keyboardType:K,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,

                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.red,
                                boxShadow: [
                                  new BoxShadow(
                                    blurRadius: 2.0,
                                    offset: const Offset(3.0, 2.0),
                                    color: Colors.red,
                                  ),
                                  new BoxShadow(
                                    blurRadius: 2.0,
                                    offset: const Offset(-3.0, 0.0),
                                    color: Colors.red,
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child:ElevatedButton(
                                child:Text('Review payment and address '),
                              )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ),

          ],
        ) ,
      ),
    );
  }
}
