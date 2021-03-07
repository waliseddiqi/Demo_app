import 'package:flutter/material.dart';

class DropDownList extends StatefulWidget{
  final List<String> location;
  final List<String> courts;
  final List<String> courttype;
  final Function(String) onchange;
  
  const DropDownList({Key key, this.onchange, this.location, this.courts, this.courttype,}) : super(key: key);

  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends  State<DropDownList> with SingleTickerProviderStateMixin{

AnimationController animationController;
Animation animation;
Animation offset;

  @override
  void initState() {
   
  animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 400));
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
    return Material(
      
      child: FadeTransition(
        opacity:animation ,
              child: SlideTransition(
                position: offset,
               child: Container(
          
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(size.height/80),
                boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
            ],
          ),
          width: size.width/1.1,
          height: size.height/2,
          child: Scrollbar(
                      child: ListView(
                        physics: PageScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                        Container(
                         
                          child: Center(child: listitem(widget.courts,size,"Court"))
                          ),
                         Container(
                           
                          child: Center(child: listitem(widget.courttype,size,"CourtType"))
                        ),
                         Container(
                        
                          child: Center(child: listitem(widget.location,size,"Location"))
                        )
                        ],
                ),
          ),
        ),
              ),
      ),
    );
  }

  Widget listitem(List<String> list,Size size,String title){
    return Center(
      child: Column(
        children: [
          Text(title),
          Container(
              width: size.width/1.1,
              height: size.height/2.2,
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context,int index)=>
              Container(
                color: Colors.blue[300],
                margin: EdgeInsets.all(size.height/45),
                
                height: size.height/7,
                child: Center(child: Text(list[index],style: TextStyle(fontSize: size.height/45,color: Colors.white,fontWeight: FontWeight.w500),)),
              ),
    ),
          ),
        ],
      ));
  }
}