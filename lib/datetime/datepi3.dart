import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Datethird extends StatefulWidget {

  @override
  _DatethirdState createState() => _DatethirdState();
}

class _DatethirdState extends State<Datethird> {
  DateTime _dateTime;
  final dateformate = DateFormat.yMd();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(_dateTime == null ? '' : dateformate.format(_dateTime)),
              onPressed: () {
                showDatePicker(
                    context: context,
                    initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2031)
                ).then((date) {
                  setState(() {
                    _dateTime = date;
                  });
                });
              },
            )
          ],
        ),
      ),
    );
  }
}