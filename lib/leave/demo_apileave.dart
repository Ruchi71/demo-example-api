import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List listOfResponse;

  Future fetchData() async {
    http.Response response;
    response = await http.post(Uri.parse(''));

    if(response.statusCode==200) {
      setState(() {
        listOfResponse = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data From Internate'),
      ),
      body: listOfResponse == null
          ? Container()
          : SingleChildScrollView(
        child: Container(
          height: 1000,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text(
                          listOfResponse[index]['type'].toString(),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          listOfResponse[index]['opening_leave'].toString(),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          listOfResponse[index]['leave_taken'].toString(),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          listOfResponse[index]['current_leave'].toString(),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          listOfResponse[index]['can_applied'].toString(),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: listOfResponse == null ? 0 : listOfResponse.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
