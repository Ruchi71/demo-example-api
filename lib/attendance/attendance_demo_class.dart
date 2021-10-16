import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';


class UpdatedScreen extends StatefulWidget {
  const UpdatedScreen({Key key}) : super(key: key);

  @override
  _UpdatedScreenState createState() => _UpdatedScreenState();
}

class _UpdatedScreenState extends State<UpdatedScreen> {

  UpdateModel _user;
  Position _currentPosition;
  List locationlist = ["Jayant","Anpara","Nigahi",""];
  String _currentAddress;
  String Address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('HR App')),
        actions:[IconButton(
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

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(50,25,0,0),
                  child: ElevatedButton(
                    onPressed: () async {
                      await _getCurrentLocation();
                      Address = await _currentAddress;
                      if(locationlist.contains(Address)){
                        final UpdateModel user = await createUser("IN");
                        setState(() {
                        _user = user;
                      });
                        print("allowed");
                    }else{
                        print("not allowed");
                      }
                      },
                    child: Text(
                      "Clock In",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.green),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.blue[900],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50,25,0,0),
                  child: ElevatedButton(
                    onPressed: () async{
                      final UpdateModel user = await createUser("OUT");
                      setState(() {
                        _user = user;
                      });
                    },
                    child: Text(
                      "Clock Out",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.green),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.blue[900],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30,5,0,0),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: Colors.blue[700],
                    size: 25,
                  ),
                ),
                if (_currentAddress != null) Padding(
                  padding: const EdgeInsets.fromLTRB(5,5,0,0),
                  child: Text(
                      _currentAddress,style: TextStyle(
                    fontSize: 17
                  ),
                  ),
                ),


              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10,10,10,0),
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
                        blurRadius: 7
                    ),],

                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25,10,0,10),
                          child: Text('Status',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.grey[800]
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(200,10,0,10),
                            child: _user == null? Container():Text("${_user.log_type}",style: TextStyle(
                                fontSize: 17,
                                color: Colors.green,
                                fontWeight: FontWeight.bold
                            ),)
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
                          padding: const EdgeInsets.fromLTRB(25,10,0,10),
                          child: Text('Total Hours',style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[800]
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(90,10,0,10),
                          child: Text('',style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[800]
                          ),),
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
                          padding: const EdgeInsets.fromLTRB(25,10,0,10),
                          child: Text('Punch In',style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[800]
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(110,10,0,10),
                          child:Text("",style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[800]
                          ),
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
                          padding: const EdgeInsets.fromLTRB(25,10,0,10),
                          child: Text('Punch Out',style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[800]
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(90,10,0,10),
                          child: Text("",style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[800]
                          ),
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
    );
  }
  _getCurrentLocation() {
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }
  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude,
          _currentPosition.longitude
      );

      Placemark place = placemarks[1];
      setState(() {
        _currentAddress = "${place.locality}";
      });
    } catch (e) {
      print(e);
    }
  }
}

Future<UpdateModel> createUser(String log_type) async{
  final String apiUrl = "";

  final response = await http.post(Uri.parse(apiUrl), body:jsonEncode({ "emp_id": "1",
    "log_type": log_type,"created_by":"2"

  })
  );

  if(response.statusCode == 200){
    final String responseString = response.body;
    print('responnse status:${response.statusCode}');
    print('response body: ${responseString}');

    return updateModelFromJson(responseString);
  }else{
    return null;
  }
}

UpdateModel updateModelFromJson(String str) => UpdateModel.fromJson(json.decode(str));

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

