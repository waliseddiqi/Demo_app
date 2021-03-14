import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownMenuCourt extends StatefulWidget{
 final String firstmobile;
 final  String secondmobile;
 final  String address;

  const DropDownMenuCourt({Key key, this.firstmobile, this.secondmobile, this.address}) : super(key: key);

  @override
  _DropDownMenuCourtState createState() => _DropDownMenuCourtState();
}

class _DropDownMenuCourtState extends State<DropDownMenuCourt> with SingleTickerProviderStateMixin {

AnimationController animationController;
Animation animation;
Animation offset;

  @override
  void initState() {
   
  animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 300));
  offset = Tween<Offset>(
    begin:Offset(0, 0),
    end: Offset(0, 0.05)
   ).animate(animationController);
  animation  = Tween(
    begin: 0.0,
    end: 1.0
  ).animate(animationController);
  animationController.forward();
    super.initState();
  }

@override
  void dispose() {
   animationController.dispose();
       super.dispose();
  }




  @override
  Widget build(BuildContext context) {



       Size size = MediaQuery.of(context).size;
    return  Material(
      color: Colors.transparent,
      child: FadeTransition(
        opacity:animation ,
              child: SlideTransition(
                position: offset,
               child: Container(
          
      
          width: size.width/1.2,
          height: size.height/4,
         child: Column(
           children: [
           widget.address == ""?SizedBox():textWidget(widget.address, size,"Address"),
          
           widget.firstmobile == null?SizedBox():textWidget(widget.firstmobile ??"", size,"Mobile"),
           
           widget.secondmobile == null?SizedBox():textWidget(widget.secondmobile ??"", size,"GSM")
           ],
         ),
        ),
              ),
      ),
    );
  }
  Widget textWidget(String text, Size size,String type){
    return SizeTransition(
      sizeFactor: animation,
          child: Container(
        margin: EdgeInsets.only(top: size.height/80),
        color: Colors.white,
        child: Row(
          children: [
            Container(
         
              margin: EdgeInsets.only(right: size.width/40),
             height: size.height/20,
              child: Center(child: Text(type,style: TextStyle(fontSize: size.height/45,color: Colors.white),)),
              color: Colors.blueAccent,
            ),
            Container(
              
              width: size.width/1.5,
              height: size.height/20,
          
              child: Center(child: Text(text),),
            ),
          ],
        ),
      ),
    );
  }
}