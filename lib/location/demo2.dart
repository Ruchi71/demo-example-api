import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';


class Demosecond extends StatefulWidget {
  const Demosecond({Key key}) : super(key: key);

  @override
  _DemosecondState createState() => _DemosecondState();
}

class _DemosecondState extends State<Demosecond> {

  Position _currentPosition;
  List locationlist = ["Jayant","Anpara","Nigahi"];
  String _currentAddress;
  String Address;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Get location"),
              onPressed: () async {
                await _getCurrentLocation();
                if(locationlist.contains(_currentAddress)){
                  print("allowed");
                }else {
                  print("not allowed");
                }
              },
            ),
            if (_currentAddress != null) Text(
                _currentAddress
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
/*
final coordinates = new Coordinates(1.10, 45.50);
addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
first = addresses.first;
print("${first.featureName} : ${first.addressLine}");
*/ 