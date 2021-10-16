import 'package:demoexample/attendance/onebutton_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class DisplayDays extends StatefulWidget {
  const DisplayDays({Key key, this.type, this.id,this.current}) : super(key: key);
  final String type;
  final String id;
  final String current;


  @override
  _DisplayDaysState createState() => _DisplayDaysState();
}

class _DisplayDaysState extends State<DisplayDays> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
    child: Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Text(widget.type),
            Text(widget.id),
            Text(widget.current)
          ],
        ),
      ),
    ),);
  }
}
