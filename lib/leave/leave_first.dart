import 'package:demoexample/leave/leave_form.dart';
import 'package:flutter/material.dart';

class LeaveButton extends StatefulWidget {
  const LeaveButton({Key key}) : super(key: key);

  @override
  _LeaveButtonState createState() => _LeaveButtonState();
}

class _LeaveButtonState extends State<LeaveButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Leave Apply')),
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications,
                size: 30,
              ),
              onPressed: () {})
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 50,),
          Center(
            child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) =>
                          LeaveForm()));

                },
                child: Text("Apply Leave")),
          )
        ],
      ),
    );
  }
}
