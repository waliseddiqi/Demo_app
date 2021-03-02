import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
List<DropdownMenuItem> items=[];
void createCourtType(){
  setState(() {
    items=List.generate(5, (index) => DropdownMenuItem(child: Text("data$index"),value: "data$index",)); 
  });

}
 @override
 void initState() { 
   super.initState();
   createCourtType();
 }
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
   return Scaffold(
     appBar: AppBar(
     title: Text("Welcome"),
     
     ),
     drawer: Drawer(
       elevation: 10,
       child: ListView(
         children: <Widget>[
            Divider(),
           draweritem("route", "Tesis Davet Et", size),
          Divider(),
           draweritem("route", "Giriş Yap / Kayıt Ol", size),
           Divider(),
            draweritem("route", "Tesis / Eğitmen Ekle", size),
           Divider(),
            draweritem("route", "Olleyy Puan", size),
           Divider(),
            draweritem("route", "Online Dersler", size),
           Divider(),
            draweritem("route", "Nasıl Çalışır?", size),
           Divider()
         ],
       ),
     ),

     body: Center(
       child: Container(
         child: Column(
           children: <Widget>[
             DropdownButton(items: items
              
             , onChanged: (value){

             })
           ],
         ),
       ),
     ),
   );
  }
  Widget draweritem(String route,String name,Size size){
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: size.width/15,top: size.height/25),
        child: Text("$name",style: TextStyle(fontSize: size.height/35,decorationThickness: 14),)),
    );
  }
}