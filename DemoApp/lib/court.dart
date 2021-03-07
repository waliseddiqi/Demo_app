import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart" as latLng;
class Court extends StatefulWidget{
  final String name;
  final String address;
  final String phonenumber;
  final String gsmnumber;
  const Court({Key key, this.name, this.address, this.phonenumber, this.gsmnumber}) : super(key: key);

  @override
  _CourtState createState() => _CourtState();
}

class _CourtState extends State<Court> {

MapOptions mapOptions = new MapOptions(

);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
   return Scaffold(
     body: Column(
       children: [
         SizedBox(
           height: size.height/3,
           child: FlutterMap(
               options: MapOptions(
          center: latLng.LatLng(51.5, -0.09),
          zoom: 13.0,
    ),
    layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: latLng.LatLng(51.5, -0.09),
                builder: (ctx) =>
                Container(
                  child: Icon(Icons.my_location),
                ),
              ),
            ],
           ),
    ])),
       ],
     )
   );
  }
}