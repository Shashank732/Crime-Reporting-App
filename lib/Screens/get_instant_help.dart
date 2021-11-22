import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:telephony/telephony.dart';

class GetInstantHelp extends StatelessWidget {
  const GetInstantHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Instant Help'),
      ),
      body: Container(
        child: FutureBuilder(
          future: _determinePosition(),
          builder: (context, snapshot){

            if(snapshot.hasData){

              var lat = (snapshot.data as LocationData).latitude.toString();
              var long = (snapshot.data as LocationData).longitude.toString();

              final Telephony telephony = Telephony.instance;
              telephony.sendSms(to: "+919602054424", message: "Emergency!! I need urgent help. Locate me here : http://www.google.com/maps/place/$lat,$long");
              return Center(child: Text('${lat}, ${long}'));

            }

            return Center(child: CircularProgressIndicator());
          },
        )
      ),
    );
  }

  Future<LocationData?>? _determinePosition() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    return location.getLocation();
  }

}
