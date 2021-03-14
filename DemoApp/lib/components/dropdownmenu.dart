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
PageController pageController;

String itemsValue = "Court";
List<String> itemValuelist = ["Court","Court Type", "Location"];
  @override
  void initState() {
  pageController = new PageController();
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
               child: Stack(
                 alignment: Alignment.topLeft,
                 children: <Widget>[
                   
                   Container(
          
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
          height: size.height/2.5,
          child: Scrollbar(
                          child: PageView(
                            controller: pageController,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: [
                            Container(
                             
                              child: Center(child: listitem(widget.courts,size,0))
                              ),
                             Container(
                               
                              child: Center(child: listitem(widget.courttype,size,1))
                            ),
                             Container(
                            
                              child: Center(child: listitem(widget.location,size,2))
                            )
                            ],
                    ),
          
          ),
        ),
        
                       Container(
                                height: size.height/17,
                                width: size.width/6,
                               
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

                                child: Center(child: Text(itemsValue,style: TextStyle(fontSize: size.height/45),)),),
                 ],
               ),
              ),
      ),
    );
  }

  Widget listitem(List<String> list,Size size ,int index){
    return InkWell(
      onTap: (){
        setState(() {
          print(index);
        if(index+1<3){
            itemsValue = itemValuelist[index+1];
            pageController.animateToPage(index+1, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
        }
       
        });
    
     
    
      },
          child: Center(
        child: Column(
          children: [
         
            Container(
                width: size.width/1.1,
                height: size.height/2.7,
              child: ListView.builder(
                padding: EdgeInsets.only(top: size.height/20),
                itemCount: list.length,
                itemBuilder: (context,int index)=>
                Container(
                  color: Colors.blue[300],
                  margin: EdgeInsets.all(size.height/45),
                  
                  height: size.height/9,
                  child: Center(child: Text(list[index],style: TextStyle(fontSize: size.height/45,color: Colors.white,fontWeight: FontWeight.w500),)),
                ),
      ),
            ),
          ],
        )),
    );
  }
}