import 'package:demoexample/attendance/attendance_demo_class.dart';
import 'package:demoexample/attendance/onebutton_attendance.dart';
import 'package:demoexample/attendance/onebutton_provider.dart';
import 'package:demoexample/attendance/userbutton_provider.dart';
import 'package:demoexample/datetime/datepi.dart';
import 'package:demoexample/datetime/datepi1.dart';
import 'package:demoexample/datetime/datepi2.dart';
import 'package:demoexample/documents/document_display.dart';
import 'package:demoexample/leave/demo_apileave.dart';
import 'package:demoexample/leave/leave_api.dart';
import 'package:demoexample/leave/leave_first.dart';
import 'package:demoexample/leave/leave_mainf.dart';
import 'package:demoexample/location/demo1.dart';
import 'package:demoexample/location/latlong1.dart';
import 'package:demoexample/location/latlongattendance.dart';
import 'package:demoexample/leave/leave_form.dart';
import 'package:demoexample/leave/leave_ui.dart';
import 'package:demoexample/navigation/screen1.dart';
import 'package:demoexample/navigation/screen_provider.dart';
import 'package:demoexample/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:demoexample/location/demo2.dart';


void main()async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "demo",
      debugShowCheckedModeBanner: false,
      home: LeaveApi(),
    );
  }
}
