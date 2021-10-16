import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Pisecond extends StatefulWidget {
  const Pisecond({Key key}) : super(key: key);

  @override
  _PisecondState createState() => _PisecondState();
}

class _PisecondState extends State<Pisecond> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: Scaffold(
        body: Container(
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    Consumer<MyModel>(
          builder: (context, myModel, child) {
            return ElevatedButton(
              style: ButtonStyle(shape: MaterialStateProperty.all
                    (RoundedRectangleBorder(borderRadius:
              BorderRadius.circular(5))),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shadowColor: MaterialStateProperty.all(Colors.blue)
              ),
              onPressed: () {
                    showDatePicker(
                        context: context,
                        initialDate: myModel._dateTime == null ? DateTime.now() : myModel._dateTime,
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2031)
                    ).then((date1) {
                      myModel.doSomething(date1);

                    });
              },
              child: Consumer<MyModel>(
                      builder: (context, myModel, child) {
                        return Text(
                            myModel._dateTime == null ? '' : myModel.dateformate.format(myModel._dateTime)
                        ,style: TextStyle(color: Colors.black),);}),
            );

          }
                    ),
                    Consumer<MyModel>(
                        builder: (context, myModel, child) {
                          return ElevatedButton(
                            style: ButtonStyle(shape: MaterialStateProperty.all
                              (RoundedRectangleBorder(borderRadius:
                            BorderRadius.circular(5))),
                                backgroundColor: MaterialStateProperty.all(Colors.white),
                                shadowColor: MaterialStateProperty.all(Colors.blue)
                            ),
                            onPressed: () {
                              showDatePicker(
                                  context: context,
                                  initialDate: myModel._date == null ? DateTime.now() : myModel._date,
                                  firstDate: DateTime(2001),
                                  lastDate: DateTime(2031)
                              ).then((date2) {
                                myModel.doSomet(date2);

                              });
                            },
                            child: Consumer<MyModel>(
                                builder: (context, myModel, child) {
                                  return Text(
                                      myModel._date == null ? '' : myModel.dateformate.format(myModel._date)
                                  ,style: TextStyle(
                                    color: Colors.black
                                  ),);}),
                          );

                        }
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

class MyModel with ChangeNotifier { //                          <--- MyModel
  DateTime _dateTime;
  DateTime _date;
  final dateformate = DateFormat("dd-MM-yyyy");

  void doSomething(date1) {
    _dateTime = date1;

    notifyListeners();
  }
  void doSomet(date2) {
    _date = date2;

    notifyListeners();
  }
}
