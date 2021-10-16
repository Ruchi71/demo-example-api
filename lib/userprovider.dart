import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class Userprovider extends StatefulWidget {
  const Userprovider({Key key}) : super(key: key);

  @override
  _UserproviderState createState() => _UserproviderState();
}

class _UserproviderState extends State<Userprovider> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Consumer<MyModel>(//                  <--- Consumer
                  builder: (context, myModel, child) {
                return myModel._user == null || myModel._user.log_type == "OUT"
                    ? ElevatedButton(onPressed: ()async {
                      await myModel.getdatain();

                }, child: Text("in"))
                    : ElevatedButton(onPressed: () async{
                      await myModel.getdataout();
                }, child: Text("out"));
              }),
              Consumer<MyModel>(//                    <--- Consumer
                  builder: (context, myModel, child) {
                return
                  myModel._user == null? Container():
                  ElevatedButton(onPressed: () {}, child:
                  Text(myModel._user.log_type))
                ;
              })
            ],
          ),
        ),
      ),
    );
  }
}

class MyModel with ChangeNotifier {

  UpdateModel _user;

  void getdatain () async {
    final UpdateModel userin = await createUser("IN");
    _user = userin;
    notifyListeners();
  }
  void getdataout () async {
    final UpdateModel userout = await createUser("OUT");
    _user = userout;
    notifyListeners();
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

Future<UpdateModel> createUser(String log_type) async {
  final String apiUrl =
      "";

  final response = await http.post(Uri.parse(apiUrl),
      body:
          jsonEncode({"emp_id": "1", "log_type": log_type, "created_by": "2"}));

  if (response.statusCode == 200) {
    final String responseString = response.body;

    return updateModelFromJson(responseString);
  } else {
    return null;
  }
}
