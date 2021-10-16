import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class OneProvider extends StatefulWidget {
  const OneProvider({Key key}) : super(key: key);

  @override
  _OneProviderState createState() => _OneProviderState();
}

class _OneProviderState extends State<OneProvider> {
  UpdateModel _user;
  DateTime now = DateTime.now();
  String formatedtime = DateFormat('hh:mm a').format(DateTime.now());


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('HR App')),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.notifications,
                  size: 30,
                ),
                onPressed: () {})
          ],
        ),
        drawer: Drawer(),
        body: Container(
          height: 900,
          width: double.infinity,
          color: Colors.grey[200],
          child: Column(
            children: [
              _user == null || _user.log_type == "OUT"
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                      child: Consumer<MyModel>(//                  <--- Consumer
                          builder: (context, myModel, child) {
                        return ElevatedButton(
                          onPressed: () async {
                            await myModel.getLocation();
                            final UpdateModel user = await createUser("IN");
                            setState(() {
                              _user = user;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(), primary: Colors.green),
                          child: Container(
                            width: 120,
                            height: 120,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 18, 0, 8),
                                  child: Text(
                                    formatedtime,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  thickness: 1,
                                  indent: 15,
                                  endIndent: 15,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                  child: Text(
                                    "Punch\n   IN",
                                    style: TextStyle(
                                        fontSize: 23, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }))
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                      child: Consumer<MyModel>(//                  <--- Consumer
                          builder: (context, myModel, child) {
                        return ElevatedButton(
                            onPressed: () async {
                              await myModel.getLocation();
                              final UpdateModel user = await createUser("OUT");
                              setState(() {
                                _user = user;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                shape: CircleBorder(), primary: Colors.green),
                            child: Container(
                              width: 120,
                              height: 120,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 18, 0, 8),
                                    child: Text(
                                      formatedtime,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                    thickness: 1,
                                    indent: 15,
                                    endIndent: 15,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                    child: Text(
                                      "Punch\n  OUT",
                                      style: TextStyle(
                                          fontSize: 23, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      })),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Colors.blue[700],
                      size: 25,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Consumer<MyModel>(//                    <--- Consumer
                              builder: (context, myModel, child) {
                        return Text(myModel.locationmessage);
                      })),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Container(
                  height: 170,
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
                            child: Text(
                              'Status',
                              style: TextStyle(
                                  fontSize: 17, color: Colors.grey[800]),
                            ),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(200, 10, 0, 10),
                              child: _user == null
                                  ? Container()
                                  : Text(
                                      "${_user.log_type}",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ))
                        ],
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.grey[500],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
                            child: Text(
                              'Total Hours',
                              style: TextStyle(
                                  fontSize: 17, color: Colors.grey[800]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(90, 10, 0, 10),
                            child: Text(
                              '',
                              style: TextStyle(
                                  fontSize: 17, color: Colors.grey[800]),
                            ),
                          )
                        ],
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.grey[500],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
                            child: Text(
                              'Punch In',
                              style: TextStyle(
                                  fontSize: 17, color: Colors.grey[800]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(110, 10, 0, 10),
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.grey[800]),
                            ),
                          )
                        ],
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.grey[500],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
                            child: Text(
                              'Punch Out',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[800]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(90, 10, 0, 10),
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.grey[800]),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<UpdateModel> createUser(String log_type) async {
  final String apiUrl =
      "";

  final response = await http.post(Uri.parse(apiUrl),
      body:
          jsonEncode({"emp_id": "1", "log_type": log_type, "created_by": "2"}));

  if (response.statusCode == 200) {
    final String responseString = response.body;
    print('responnse status:${response.statusCode}');
    print('response body: ${responseString}');

    return updateModelFromJson(responseString);
  } else {
    return null;
  }
}

UpdateModel updateModelFromJson(String str) =>
    UpdateModel.fromJson(json.decode(str));

String updateModelToJson(UpdateModel data) => json.encode(data.toJson());

class UpdateModel {
  UpdateModel({
    this.log_type,
  });

  String log_type;

  factory UpdateModel.fromJson(Map<String, dynamic> json) => UpdateModel(
        log_type: json["log_type"],
      );

  Map<String, dynamic> toJson() => {
        "log_type": log_type,
      };
}

class MyModel with ChangeNotifier {
  //                          <--- MyModel
  var locationmessage = "";

  void getLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var lat = position.latitude;
    var long = position.longitude;

    locationmessage = "latitude: $lat, longitude: $long";
    notifyListeners();
  }
}
