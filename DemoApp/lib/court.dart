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
     body: ListView(
       children: [
         Container(
             child: Image.asset("./assets/court.jpg"),
           ),
         Center(
           child: Container(
             margin: EdgeInsets.only(top: size.height/20,right: size.width/3),
             child: Text(widget.name,style: TextStyle(fontSize: size.height/30,fontWeight: FontWeight.w500),),
           ),
         ),
          SizedBox(height: size.height/10,),
              Center(
                child: Container(
                   margin: EdgeInsets.only(right: size.width/1.2),
                  child: Text("Map",style: TextStyle(fontSize: size.height/30,fontWeight: FontWeight.w500),),),
              ),
         Container(
           width: size.width,
           height: size.height/4,
           child: Center(
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
    ]),
           ),
         ),
           Container(child: Row(
               children: <Widget>[
                 Text("   Address:"+widget.address),
               ],
             ),),
             Center(
               child: Container(
                 margin: EdgeInsets.only(top:size.height/20),
                width: size.width/3,
                height: size.height/15,
                child: Center(child: Text("Online Reservation",style: TextStyle(color: Colors.white,fontSize: size.height/45),)),
                   decoration: BoxDecoration(
                     color: Colors.purple[300],
                     borderRadius: BorderRadius.circular(size.height/80),
                   ),
                   ),
             ),
           
       ],
     )
   );
  }
}