import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';
import 'package:quik_scan/model/location.dart';
import 'package:flutter_map/flutter_map.dart';

class Geo extends StatefulWidget {
  Geo({Key key, })
      : super(key: key);


  @override
  State<StatefulWidget> createState() => new _GeoState();
}

  class _GeoState extends State<Geo> {

  var centre = LatLng(43.9457842,-78.895896);
  var path = [LatLng(43.9457842,-78.893896), LatLng(43.9437842,-78.897896), LatLng(43.9457842,-78.895896)];  
  static Location l1 = new Location('L1', 'L1Address', LatLng(37.7407,-119.513));
  var locations = [l1];
  var geolocator = Geolocator();

  signOut() async {
   Navigator.pushReplacementNamed(context, "/logout");
  }

  
  @override
  void initState(){
    calculateCenter();
    updatePath();
    super.initState();
  }

  void calculateCenter(){
    double lat = 0;
    double lng = 0;
    for (int i = 0; i < locations.length; ++i)
    {
      lat += locations[i].latlng.latitude;
      lng += locations[i].latlng.longitude;
    }
    lat /= locations.length;
    lng /= locations.length;

    centre = LatLng(lat, lng);
  }

  void updatePath(){
    path.clear();
    for (int i = 0; i < locations.length; ++i)
    {
      path.add(locations[i].latlng);
    }
  }

  List<Marker> addMarkers()
  {
    List<Marker> markers = new List<Marker>();
    for (int i = 0; i < locations.length; ++i)
    {
      markers.add(new Marker(
                width: 60.0,
                height: 60.0,
                point: locations[i].latlng,
                builder: (context) => IconButton(
                    icon: Icon(Icons.adjust),
                    color: Colors.blue,
                    iconSize: 45.0,
                    onPressed: () {
                      print('Icon clicked');
                    },
                  ),
                
              ));
    }
    return markers;
  }

  void addLocation(){
    
    geolocator.checkGeolocationPermissionStatus().then((GeolocationStatus geolocationStatus) {
    print('Got permission');
    });
    geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
      .then((userLocation) {
        geolocator.placemarkFromCoordinates(userLocation.latitude, userLocation.longitude).then((List<Placemark> places) {
          for (Placemark place in places)
          {
            Location newLoc = new Location(place.name, place.subThoroughfare + ' ' + place.thoroughfare, LatLng(userLocation.latitude, userLocation.longitude));
            locations.add(newLoc);
            print('\t${place.name}, ${place.subThoroughfare}, ${place.thoroughfare}, ${place.locality}, ${place.subAdministrativeArea}');
            setState(() {
              calculateCenter();
              updatePath();
            });
          }
        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        title: Text(
          "Recent Scans",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut)
          ],
        automaticallyImplyLeading: false,
      ),
      body: FlutterMap(
        options: MapOptions(
          minZoom: 8.0,
          maxZoom: 48.0,
          center: centre,
        ),
        layers: [
          TileLayerOptions(

            urlTemplate: 'https://api.mapbox.com/styles/v1/rfortier/cjzcobx1x2csf1cmppuyzj5ys/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicmZvcnRpZXIiLCJhIjoiY2p6Y282cWV4MDg0ZDNibG9zdWZ6M3YzciJ9.p1ePjCH-zs0RdBbLx40pgQ',
            additionalOptions: {
              'accessToken': 'sk.eyJ1IjoiZmZ1dWZnIiwiYSI6ImNrM202N25ndDFjNmkzZXJtdDFvbm9wMTIifQ.i6PKktTZ2QaY0QKp_sFdbQ',
              'id': 'mapbox.mapbox-streets-v8'
            }
          ),
          MarkerLayerOptions(
            markers: addMarkers()
          ),
          PolylineLayerOptions(
            polylines: [
              Polyline(
                points: path,
                strokeWidth: 2.0,
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
      //floatingActionButton: IconButton(icon: Icon(Icons.add), onPressed: (){addLocation();}),
    );
  }

}