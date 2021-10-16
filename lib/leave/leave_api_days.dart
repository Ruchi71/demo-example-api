
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LeaveFormPro extends StatefulWidget {
  const LeaveFormPro({Key key, this.type, this.id,this.current}) : super(key: key);
  final String type;
  final String id;
  final String current;

  @override
  _LeaveFormProState createState() => _LeaveFormProState();
}

class _LeaveFormProState extends State<LeaveFormPro> {
  final TextEditingController leavereason = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: Scaffold(
        appBar: AppBar(
          //backgroundColor: kPrimaryColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Leave Apply'),
        ),
        body: SingleChildScrollView(
          child: Builder(
              builder: (context) {
                return Consumer<MyModel>(
                    builder: (context, myModel, child) {
                      return
                        Container(
                          width: double.infinity,
                          color: Colors.grey[200],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                                child: Text(
                                  'Leave Type',
                                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                                child: Container(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        // color: kSec.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                                    child: Text(
                                      widget.type,
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                                    child: Text(
                                      'Start Date',
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(100, 20, 0, 0),
                                    child: Text(
                                      'End Date',
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                                    child: Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            // color: kSec.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 5),
                                        ],
                                      ),
                                      child: Consumer<MyModel>(
                                          builder: (context, myModel, child) {
                                            return ElevatedButton(
                                              style: ButtonStyle(
                                                  shape: MaterialStateProperty.all(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(5))),
                                                  backgroundColor:
                                                  MaterialStateProperty.all(Colors.white),
                                                  shadowColor:
                                                  MaterialStateProperty.all(Colors.blue)),
                                              onPressed: () {
                                                showDatePicker(
                                                    context: context,
                                                    initialDate: myModel._startdate == null
                                                        ? DateTime.now()
                                                        : myModel._startdate,
                                                    firstDate: DateTime(2001),
                                                    lastDate: DateTime(2031))
                                                    .then((date) async {
                                                 await myModel.StartDate(date);
                                                  myModel.leave_type = widget.id;
                                                  myModel.available_leave = widget.current;
                                                  myModel.start_date = myModel.dateformate
                                                      .format(myModel._startdate);
                                                  if(myModel._enddate != null) {
                                                    myModel.end_date =
                                                        myModel.dateformate
                                                            .format(
                                                            myModel._enddate);
                                                    final DaysApi user = await UserLeave(
                                                        myModel.leave_type,
                                                        myModel.start_date,
                                                        myModel.end_date,
                                                        myModel.available_leave);

                                                    await myModel.getdata(user);
                                                  }
                                                   });
                                              },
                                              child: Consumer<MyModel>(
                                                  builder: (context, myModel, child) {
                                                    return Text(
                                                      myModel._startdate == null
                                                          ? ''
                                                          : myModel.dateformate
                                                          .format(myModel._startdate),
                                                      style: TextStyle(
                                                          color: Colors.black, fontSize: 17),
                                                    );
                                                  }),
                                            );
                                          }),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(40, 10, 0, 0),
                                    child: Container(
                                      height: 40,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            //color: kSec.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 5),
                                        ],
                                      ),
                                      child: Consumer<MyModel>(
                                          builder: (context, myModel, child) {
                                            return ElevatedButton(
                                              style: ButtonStyle(
                                                  shape: MaterialStateProperty.all(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(5))),
                                                  backgroundColor:
                                                  MaterialStateProperty.all(Colors.white),
                                                  shadowColor:
                                                  MaterialStateProperty.all(Colors.blue)),
                                              onPressed: () {
                                                showDatePicker(
                                                    context: context,
                                                    initialDate: myModel._enddate == null
                                                        ? DateTime.now()
                                                        : myModel._enddate,
                                                    firstDate: DateTime(2001),
                                                    lastDate: DateTime(2031))
                                                    .then((date) async {
                                                  myModel.EndDate(date);
                                                  myModel.leave_type = widget.id;
                                                  myModel.available_leave = widget.current;
                                                  if (myModel._startdate != null) {
                                                    myModel.start_date =
                                                        myModel.dateformate
                                                            .format(
                                                            myModel._startdate);
                                                    myModel.end_date =
                                                        myModel.dateformate
                                                            .format(
                                                            myModel._enddate);
                                                    final DaysApi user = await UserLeave(
                                                        myModel.leave_type,
                                                        myModel.start_date,
                                                        myModel.end_date,myModel.available_leave);
                                                    myModel.getdata(user);
                                                  }});
                                              },
                                              child: Consumer<MyModel>(
                                                  builder: (context, myModel, child) {
                                                    return Text(
                                                      myModel._enddate == null
                                                          ? ''
                                                          : myModel.dateformate
                                                          .format(myModel._enddate),
                                                      style: TextStyle(
                                                          color: Colors.black, fontSize: 17),
                                                    );
                                                  }),
                                            );
                                          }),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                                child: Text(
                                  'Days',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Consumer<MyModel>(builder: (context, myModel, child) {
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          // color: kSec.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5),
                                      ],
                                    ),
                                    child: myModel._daysApi == null
                                        ? Container()
                                    :Center(
                                        child: Text(myModel._daysApi == null? "":myModel._daysApi.days,
                                            style: TextStyle(fontSize: 20))),
                                  ),
                                );
                              }),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                                child: Text(
                                  'Leave Reason',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(30, 10, 20, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          // color: kSec.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 5),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                                  child: TextFormField(
                                    controller: leavereason,
                                    decoration: InputDecoration.collapsed(
                                      hintText: "Leave Reason",
                                    ),
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                    maxLines: 5,
                                  ),
                                ),
                              ),
                              widget.type == "Sick Leave" ? medicalcontainer() : Container(),
                              Container(
                                height: 70,
                                child: Padding(
                                    padding: const EdgeInsets.fromLTRB(30, 30, 20, 0),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                       /*final snackbarpass = SnackBar(content: Text("Leave Applied successfully "));
                                        final snackbarfail = SnackBar(content: Text("Error in leave Applied"));
                                        myModel.leave_type = widget.id;
                                        myModel.no_days = myModel._daysApi.days;
                                        myModel.normal_leave = myModel._daysApi.normalLeave;
                                        myModel.salary_deduction_leave = myModel._daysApi.salaryDeductionLeave;
                                        myModel.leave_reason = leavereason.text;
                                        myModel.start_date = myModel.dateformate
                                            .format(myModel._startdate);
                                        myModel.end_date = myModel.dateformate
                                            .format(myModel._enddate);
                                         final SaveLeaveModel userdata = await SaveLeave(
                                           myModel.normal_leave,myModel.leave_type,myModel.salary_deduction_leave,
                                            myModel.no_days,myModel.leave_reason,myModel.start_date,myModel.end_date
                                         );
                                         await myModel.getdata(userdata);
                                         if(myModel._model.status == "success"){
                                          Scaffold.of(context).showSnackBar(snackbarpass);
                                        } else{
                                          Scaffold.of(context).showSnackBar(snackbarfail);
                                        }*/

                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Apply',
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5))),
                                        //  backgroundColor: MaterialStateProperty.all(kPrimaryColor,),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        );}
                );}
          ),
        ),
      ),
    );
  }

  Container medicalcontainer() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
            child: Text(
              'Medical Certificate',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 35,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 20, 0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RotationTransition(
                        turns: AlwaysStoppedAnimation(30 / 360),
                        child: Icon(
                          Icons.attach_file,
                          size: 10,
                          // color: kPrimaryColor,
                        ),
                      )
                    ],
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                )),
          ),
         Padding(
            padding: const EdgeInsets.fromLTRB(150, 5, 0, 0),
            child: Text(
              'Attach files JPG or Pdf',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
  ],
      ),
    );
  }
}

class MyModel with ChangeNotifier {
  //                          <--- MyModel
  DateTime _startdate;
  DateTime _enddate;
  final dateformate = DateFormat("dd-MM-yyyy");
  DaysApi _daysApi;
  String leave_type;
  String start_date;
  String end_date;
  String no_days;
  String leave_reason;
  String normal_leave;
  String salary_deduction_leave;
  String available_leave;
  //SaveLeaveModel _model;

  void StartDate(date) {
    _startdate = date;
    notifyListeners();
  }

  void EndDate(date) {
    _enddate = date;
    notifyListeners();
  }

  void getdata(user) {
    _daysApi = user;
    notifyListeners();
  }

/* void savedata(userdata) {
    _model = userdata;
    notifyListeners();
  }*/
}

Future<DaysApi> UserLeave(String leave_type, start_date, end_date,String available_leave) async {
  final String apiUrl =
      "";

  final response = await http.post(Uri.parse(apiUrl),
      body: jsonEncode({
        "employee_id": "45",
        "leave_type": leave_type.toString(),
        "start_date": start_date.toString(),
        "end_date": end_date.toString(),
        "available_leave":available_leave.toString()

         /* "employee_id": "45",
          "leave_type": "8",
          "start_date": "17-10-2021",
          "end_date": "18-10-2021"*/
       // "available_leave":available_leave


      }));
  print(start_date);
  print(end_date);
  print(leave_type);
  print(available_leave);

  if (response.statusCode == 200) {
    final String responseString = response.body;
    print(responseString);
    return daysApiFromJson(responseString);
  } else {
    return null;
  }
}

DaysApi daysApiFromJson(String str) => DaysApi.fromJson(json.decode(str));

String daysApiToJson(DaysApi data) => json.encode(data.toJson());

class DaysApi {
  DaysApi({
    this.days,

  });

  String days;


  factory DaysApi.fromJson(Map<String, dynamic> json) => DaysApi(
    days: json["days"].toString(),

  );

  Map<String, dynamic> toJson() => {
    "days": days,
  };
}
