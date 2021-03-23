import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoder/geocoder.dart';
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
MapController mapController = new MapController();
latLng.LatLng lat ;
latLng.LatLng defaultt =  latLng.LatLng(51.5, -0.09);
@override
  void initState(){
   
    super.initState();
  }
  void getlocation()async{
  List<Address> address =await  Geocoder.local.findAddressesFromQuery(widget.address);

  if(address.length!=0||address!=null){
    setState(() {
        lat =  latLng.LatLng( address[0].coordinates.latitude,address[0].coordinates.longitude);
    });
    
  }
  else{
    setState(() {
       lat =  latLng.LatLng(51.5, -0.09);
    });
   
  }

  
 
  }
  void move(){
     mapController.move(lat, 100);
     print("Sdf");
  }
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
               mapController: mapController,
                 options: MapOptions(
                   bounds:LatLngBounds(lat==null?defaultt:lat)
            
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
                  point: lat,
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
               child: Center(child: Text("Online Reservation",style: TextStyle(color: Colors.white,fontSize: size.height/60,fontWeight: FontWeight.w500),)),
                  decoration: BoxDecoration(
                    color: Colors.purple[300],
                    borderRadius: BorderRadius.circular(size.height/80),
                  ),
                  ),
             ),
             RaisedButton(onPressed: (){
               move();
             })
           
       ],
     )
   );
  }
}