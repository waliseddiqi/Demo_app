import 'dart:convert';

import 'package:DemoApp/components/dropdownmenuCourts.dart';
import 'package:DemoApp/court.dart';
import 'package:DemoApp/model/courts_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Courts extends StatefulWidget{
  final String title;
  final Color pageColor;
  const Courts({Key key, this.title, this.pageColor}) : super(key: key);
  @override
  _CourtsState createState() => _CourtsState();
}

class _CourtsState extends State<Courts> with SingleTickerProviderStateMixin {
var jsonResult;
List<CourtsModel> courtsModel=[];
List<bool> isVisible = [];

AnimationController animationController;
Animation animation;



void initanimation(){
  animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 300));

  animation  = Tween(
    begin: 0.0,
    end: 1.0
  ).animate(animationController);
  animationController.forward();
}

void loaddatas()async{
String data = await DefaultAssetBundle.of(context).loadString("assets/courts.json");
jsonResult = json.decode(data);
setState(() {
  courtsModel = jsonResult.map<CourtsModel>((json) => new CourtsModel.fromJson(json)).toList();
  if(courtsModel.length != 0){

isVisible = List<bool>.generate(courtsModel.length, (index) => false);
}
});

}


  @override
  void initState() {
    initanimation();
  try {
    loaddatas();
  } catch (e) {
    print(e);
  }
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
  return Hero(
   
    placeholderBuilder: (context, heroSize, child) => Container(width: heroSize.width,height: heroSize.height,
    child: Image.asset("./assets/"+widget.title+".png"),
    color: Colors.white,
   
    ),
    tag: widget.title??"title",
      child: Material(
        child: Scaffold(
        appBar: AppBar(
          title: Text("Courts"),
          backgroundColor: Colors.blue,
             shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        ),
        backgroundColor: widget.pageColor??Colors.blueAccent[100],
        body:Container(
            child:
             
            courtsModel.length==0?
            Center(child: CircularProgressIndicator(),):ListView.builder(
          itemCount: courtsModel.length,
          itemBuilder:(context,index)=>
          itemCard(size, index)
 ),
          ),
    ),
      ),
  );
  }
  Widget itemCard(Size size,int index){
    return ScaleTransition(

      scale: animation,
          child: Column(
        children: [
          Container(
            
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                      InkWell(
                  child: Container(
                    width: size.width/1.2,
                    height: size.height/40,
                        decoration: BoxDecoration(
                              boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                        ],
                          color: Colors.white,
                            
                      ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                            isVisible[index] = !isVisible[index];
                        });
                      
                      },
                      child: 
                      Center(child: 
                      Text("show more",style: TextStyle(fontSize: size.height/55,fontWeight: FontWeight.w500),),)),
                  ),
                ),
                Container(
                margin: EdgeInsets.all(size.height/35),
                width: size.width/1.1,
                height: size.height/6,
               
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
                child: ListTile(
                  title: Text("${courtsModel[index].name??""}"),
                  subtitle: Text("${courtsModel[index].city??""} ""${ courtsModel[index].district??""}"),
                  trailing:InkWell(child:
                InkWell(
                  onTap: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>Court(
                      name: courtsModel[index].name,
                      address: courtsModel[index].address,
                      phonenumber: courtsModel[index].firstmobiletel,
                      gsmnumber: courtsModel[index].firsttel,
                    )));
                  },
                 child: Container(
                 width: size.width/6,
                 height: size.height/20,
                 child: Center(child: Text("Contact",style: TextStyle(color: Colors.white,fontSize: size.height/45),)),
                    decoration: BoxDecoration(
                      color: Colors.purple[300],
                      borderRadius: BorderRadius.circular(size.height/80),
                    ),
                    ),
             ),)
                  
                  )),
          
              ],
            ),
          ),
          Visibility(
          
            visible: isVisible[index],
            child: DropDownMenuCourt(
              firstmobile: courtsModel[index].firstmobiletel,
              secondmobile: courtsModel[index].secondmobiletel,
              address: courtsModel[index].address,
            ))
        ],
      ),
    );
  }
}

