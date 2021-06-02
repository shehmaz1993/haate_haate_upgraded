import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
class DateTimeState extends StatefulWidget {
  const DateTimeState({Key key}) : super(key: key);

  @override
  _DateTimeStateState createState() => _DateTimeStateState();
}

class _DateTimeStateState extends State<DateTimeState> {

  DateTime selectedDate = DateTime.now();
  TextEditingController _date = new TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _date.value = TextEditingValue(text: picked.toString());
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Container(
          height: 100,
          width:300,
          child: GestureDetector(
            onTap: () => _selectDate(context),
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
        ) ,
      ),
    );
  }
}
