import 'package:flutter/material.dart';
import 'Size.dart';
class AlertState extends StatefulWidget {
  const AlertState({Key key}) : super(key: key);

  @override
  _AlertStateState createState() => _AlertStateState();
}

class _AlertStateState extends State<AlertState> {

   customDialog(BuildContext context,String str){
     SizeConfig().init(context);
     return showDialog(context: context,
         builder:(context){
          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            child:Container(
              height:SizeConfig.blockSizeHorizontal*45.0, //130.0,
              width:SizeConfig.blockSizeVertical*25.0, //250.0,
              child:
              Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.fromLTRB(15.0,15.0,15.0,70.0),//15.0
                    child: Container(
                        //height: ,

                        child: Text(str, style: TextStyle(color: Colors.black,fontSize: 20.0),)),
                  ),
                  Container(
                    height: 2,
                    width:double.infinity,
                    color: Colors.red,
                  ),


                  Padding(
                    padding: EdgeInsets.only(top:SizeConfig.blockSizeVertical*2.0),
                    child: MaterialButton(
                       disabledColor: Colors.blue,
                       highlightColor: Colors.red,

                      // focusColor: Colors.red,
                        onPressed:(){

                      Navigator.pop(context);

                    } , child: Text('OK')),
                  )
                ],
              ),
            )
          );

     }
     );

   }




  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
           child: Text('Press'),
          onPressed: (){
             customDialog(context, ' show me the dialog');
          },
        ),
      ),
    );
  }
}
