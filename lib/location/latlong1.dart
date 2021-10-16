import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class LatLongProvider extends StatefulWidget {
  const LatLongProvider({Key key}) : super(key: key);

  @override
  _LatLongProviderState createState() => _LatLongProviderState();
}

class _LatLongProviderState extends State<LatLongProvider> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
        create: (context)=>MyModel(),
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.location_on,size: 30,),
              SizedBox(height: 20,),
              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Consumer<MyModel>( //                  <--- Consumer
                    builder: (context, myModel, child) {
                      return RaisedButton(
                        child: Text('Get Location'),
                        onPressed: (){
                          myModel.getLocation();
                        },
                      );
                    },
                  )
              ),
              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel>( //                    <--- Consumer
                  builder: (context, myModel, child) {
                    return Text(myModel.locationmessage);
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class MyModel with ChangeNotifier { //                          <--- MyModel
  var locationmessage = "";


  void getLocation () async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var lat = position.latitude;
    var long = position.longitude;

    locationmessage = "latitude: $lat, longitude: $long";
    notifyListeners();

  }

}
