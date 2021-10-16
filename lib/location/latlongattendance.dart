import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LatLongAttendance extends StatefulWidget {
  const LatLongAttendance({Key key}) : super(key: key);

  @override
  _LatLongAttendanceState createState() => _LatLongAttendanceState();
}

class _LatLongAttendanceState extends State<LatLongAttendance> {

  var locationmessage = "";

  void getLocation () async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastposition = await Geolocator.getLastKnownPosition();
    print(lastposition);
    var lat = position.latitude;
    var long = position.longitude;

    setState(() {
      locationmessage = "latitude: $lat, longitude: $long";
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LatLong"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.location_on,size: 30,),
            SizedBox(height: 20,),
            Text("${locationmessage}"),
            ElevatedButton(
                onPressed: () {
                  getLocation();
                },
                child: Text("Get Location"))
          ],
        ),
      ),
    );
  }
}
