import 'dart:convert';

import 'package:DemoApp/Courts.dart';
import 'package:DemoApp/components/dropdownmenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/courts_model.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
List<String> courtslist = ["kadikoy","uskudar","kucukcekmece","beylikduzu"];
List<String> locationlist = ["kadikoy","uskudar","kucukcekmece","beylikduzu","bakirkoy","aksaray","fatih","sultangazi"];
List<String> courttypelist = ["Football","Tenis","Volleyball","Cricket","Basketball","Yoga"];
String courtString = "Courts";
String courtTypeString = "Court Type";
String locationString = "Location";
bool isVisible=false;
List<String> items = [];
List<Color> cardColor=[Colors.orange[300],Colors.purple[300],Colors.blue[300],Colors.green[300]];
double top=0.0;
List<CourtsModel> courtsModel=[];
var jsonResult;
ScrollController scrollController;
List<Widget> listitems = [];
double scrollvelocity= 0.0;
void loaddatas()async{
String data = await DefaultAssetBundle.of(context).loadString("assets/courts.json");
jsonResult = json.decode(data);
setState(() {
  courtsModel = jsonResult.map<CourtsModel>((json) => new CourtsModel.fromJson(json)).toList();
  if(courtsModel.length !=0){
 listitems =   List<Widget>.generate(courtsModel.length, (index) => courtsitems(MediaQuery.of(context).size,index));
  }
  print(listitems.length);
});

}


@override
void initState() { 
  scrollController = ScrollController();

  super.initState();
  loaddatas();
}



  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
   return Scaffold(
    
     appBar: AppBar(
      elevation: 10,
     title: Text("Welcome"),
     shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
     ),
     drawer: Drawer(
       elevation: 100,
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

     body: Stack(
       children: [
       
           
         Container(
             child: ListView(
             
               children: <Widget>[
               itemField(size,courttypelist,0,courtTypeString),
               Center(
                 child: Visibility(
                   visible: isVisible,
                   child: DropDownList(courts: courtslist,courttype: courttypelist,location: locationlist,)),
               ),
               SizedBox(
                 width: size.width/3,
                 height: size.height/3,
                 child: Scrollbar(
                     isAlwaysShown: true,
                     controller:scrollController,
                     child: ListView(
                       controller: scrollController,
                     scrollDirection: Axis.horizontal,
                     children: [
                       bottomCards("Golf",size,0),
                    bottomCards("Football",size,1),
                     bottomCards("Volleyball",size,2),
                      bottomCards("Yoga",size,3),
                     ],
                   ),
                 ),
               ),

               Container(
                 margin: EdgeInsets.all(size.height/25),                            
                 child: Text("#Recent Courts",style: TextStyle(fontSize: size.height/34,fontWeight: FontWeight.w500),),
               ),
               Container(
                 child: Column(
                   children: <Widget>[
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Text("+Court",  style: TextStyle(fontSize: size.height/40),),
                         Text("+Type",  style: TextStyle(fontSize: size.height/40),),
                         Text("+City" , style: TextStyle(fontSize: size.height/40),)
                       ],
                     ),
                     Divider(),
                     courtsListview(size)
                   ],
                 ),
               )
                 

            
               ],
             ),
           ),





       ],
     ),
   );
  }
  Widget courtsListview(Size size){
    return Container(
    height: size.height/2,
        margin: EdgeInsets.only(top:size.height/45),
      child: ListWheelScrollView(
        itemExtent: 100,
       
       
        diameterRatio: 4.7,
        physics: BouncingScrollPhysics(),
       children: 
         listitems.length == 0 ?[SizedBox()]:listitems
       
     ),
    );
  }



  Widget draweritem(String route,String name,Size size){
    return InkWell(
      onTap: (){
        Navigator.pop(context);
        Navigator.push(context, CupertinoPageRoute(builder: (context)=>Courts()));
      },
      child: Container(
        margin: EdgeInsets.only(left: size.width/15,top: size.height/25),
        child: Text("$name",style: TextStyle(fontSize: size.height/35,decorationThickness: 14),)),
    );
  }

  Widget bottomCards(String title,Size size,int order){
    return InkWell(
        onTap: (){
     Navigator.push(context, MaterialPageRoute(builder: (context)=>Courts(title: title,pageColor: cardColor[order],)));
        },
        child: Container(
        margin: EdgeInsets.all(size.height/20),
    width: size.width/2,
     height: size.height/3,
     child: GestureDetector(
        onLongPressStart: (LongPressStartDetails details){
     setState(() {
       
         cardColor[order]=Color.fromRGBO(45,45,45, 1);
     });
        
        },
       child: Center(
     child: Stack(
       alignment: Alignment.centerRight,
       children: [
         
         AnimatedContainer(
           duration: Duration(milliseconds: 400),
           margin: EdgeInsets.only(top: size.height/20),
           width: size.width/1.1,
           height: size.height/5,
         
           decoration: BoxDecoration(
               color: cardColor[order],
             borderRadius: BorderRadius.circular(size.height/80),
           ),
           child: Container(
            
             child: Text(title,style: TextStyle(color: Colors.white,fontSize: size.height/35),),
           ),
         ),
         Hero(
           tag: title,
         
            child: Material(
                      child: Container(
               width: size.width/5,
               height: size.height/5,
               decoration: BoxDecoration(
                       boxShadow: [
                     BoxShadow(
                       color: Colors.grey,
                       offset: Offset(0.0, 1.0), //(x,y)
                       blurRadius: 6.0,
                     ),
                 ],
                   color: Colors.white,
                      borderRadius: BorderRadius.circular(size.height/80),
               ),
             
               child:Image.asset("./assets/"+title+".png")
             ),
           ),
         ),
       ],
     ),
        ),
        ),
      ),
      );
  }


  Widget courtsitems(Size size,int index){
    return   Center(
        child: Container(
        
          height: size.height/7,
          width: size.width/1.1,
          margin: EdgeInsets.only(top:size.height/45),
            decoration: BoxDecoration(
                 boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                  ],
                    color:Colors.blue[300],
                    borderRadius: BorderRadius.circular(size.height/80),
                  ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                
               
                child: Text("${courtsModel[index].name??""}"
                ,overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: size.height/45,color: Colors.white),
                )),
                  Flexible(
                  
                    child: Text("${courtsModel[index].district??""}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: size.height/45,color: Colors.white),
                    )),
                    Flexible(
                    
                      child: Text("${courtsModel[index].city??""}",overflow: TextOverflow.ellipsis,
                               style: TextStyle(fontSize: size.height/45,color: Colors.white),
                      )),
            ],
          ),
        ),
      );
  }


  Widget itemField(Size size,List<String> items,int order,String title){
    return Center(
      child: Container(
      
         margin: EdgeInsets.only(left: size.width/25, top: size.height/40, right: size.width/25, bottom:size.height/50),
 
  
        decoration: BoxDecoration(
          color: Colors.white,
         borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 4,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(padding: EdgeInsets.all(size.height/30),
              child: Text("$title"),
              ),
               InkWell(
                 onTap: (){
                   setState(() {
                     isVisible=!isVisible;
                   });
                 },
                  child: Container(
                   child: Center(child: Text("Arama",style: TextStyle(color: Colors.white,fontSize: size.height/45,
                    fontWeight: FontWeight.w500
                   ),)),
                     width: size.width/4,
                     height: size.height/7,
                      decoration: BoxDecoration(
                        color: Colors.purple[400],
                        borderRadius: BorderRadius.only(
                       
                          topRight: Radius.circular(10),
                         
                          bottomRight: Radius.circular(10)
                      ),
                      
                     ),
                           ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}