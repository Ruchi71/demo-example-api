import 'package:demoexample/navigation/screen2.dart';
import 'package:demoexample/navigation/screen3.dart';
import 'package:demoexample/navigation/screen4.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class navipro extends StatefulWidget {
  const navipro({Key key}) : super(key: key);

  @override
  _naviproState createState() => _naviproState();
}

class _naviproState extends State<navipro> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: Scaffold(
        body: Consumer<MyModel>(
        builder: (context, myModel, child) {

            return myModel.screens[myModel._currentindex];}),
        bottomNavigationBar: Consumer<MyModel>(
    builder: (context, myModel, child) {
          return BottomNavigationBar(
            currentIndex: myModel._currentindex,
            onTap: (index){
              myModel.doSomething(index);

            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
              BottomNavigationBarItem(icon: Icon(Icons.article_rounded),label: "article"),
              BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined),label: "calendar")
            ],

          );}
        ),
      ),
    );

  }
}

class MyModel with ChangeNotifier { //                          <--- MyModel

  int _currentindex = 0;
  final screens = [
    SecondScreen(),
    ThirdScreen(),
    FourthScreen()

  ];

  void doSomething(index) {
    _currentindex = index;
    notifyListeners();
  }
}
