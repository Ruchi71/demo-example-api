import 'package:demoexample/navigation/screen2.dart';
import 'package:demoexample/navigation/screen3.dart';
import 'package:demoexample/navigation/screen4.dart';
import 'package:flutter/material.dart';

class navi extends StatefulWidget {
  const navi({Key key}) : super(key: key);

  @override
  _naviState createState() => _naviState();
}

class _naviState extends State<navi> {
  int _currentindex = 0;
  final screens = [
    SecondScreen(),
    ThirdScreen(),
    FourthScreen()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        onTap: (index){
          setState(() {
            _currentindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.article_rounded),label: "article"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined),label: "calendar")
        ],

      ),
    );

  }
}
