import 'package:flutter/material.dart';

class Statistics{
  late BuildContext context;
  Statistics(this.context);
  double margin = 20;
  responsiveViewWidth() {
    double width = 0;
    double viewportWidth = MediaQuery.of(context).size.width;
    if (viewportWidth > 500) {
      width = (viewportWidth / 3) - margin;
    } else{
      width = (viewportWidth / 2) - margin;
    }
    return width;
  }
  product(){
    return InkWell(
      onTap: (){},// Goto products
      child:Container(
        alignment: Alignment.center,
        width: responsiveViewWidth(),
        height: MediaQuery.of(context).size.height/2.2,
        margin: EdgeInsets.only(left: (margin/2),right: (margin/2),bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey, width: 0.5),
            image: DecorationImage(
              image: Image.asset("assets/s1.jpg").image,
              fit: BoxFit.cover,
            ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(10, 30, 70, 0.8),
          ),
          constraints: const BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.emoji_food_beverage, color: Colors.white, size: 30,),
              Padding(padding: EdgeInsets.all(10), child:Text("Products",style: TextStyle(fontFamily: "verdana", fontSize: 18,fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis, color: Colors.white)),),
              Padding(padding: EdgeInsets.all(10), child:Text("10",style: TextStyle(fontFamily: "verdana", color: Colors.white)),),

            ],
          ),
        ),
      ) ,
    );
  }
  search(){
    return InkWell(
      onTap: (){},// Goto products
      child:Container(
        alignment: Alignment.center,
        width: responsiveViewWidth(),
        height: MediaQuery.of(context).size.height/2.2,
        margin: EdgeInsets.only(left: (margin/2),right: (margin/2),bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 0.5),
          image: DecorationImage(
            image: Image.asset("assets/s3.jpg").image,
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(10, 30, 70, 0.8),
          ),
          constraints: const BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.search, color: Colors.white, size: 30,),
              Padding(padding: EdgeInsets.all(10), child:Text("Daily Search",style: TextStyle(fontFamily: "verdana", fontSize: 18,fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis, color: Colors.white)),),
              Padding(padding: EdgeInsets.all(10), child:Text("10",style: TextStyle(fontFamily: "verdana", color: Colors.white)),),

            ],
          ),
        ),
      ) ,
    );
  }
  order(){
    return InkWell(
      onTap: (){},// Goto products
      child:Container(
        alignment: Alignment.center,
        width: responsiveViewWidth(),
        height: MediaQuery.of(context).size.height/2.2,
        margin: EdgeInsets.only(left: (margin/2),right: (margin/2),bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 0.5),
          image: DecorationImage(
            image: Image.asset("assets/s2.jpg").image,
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(10, 30, 70, 0.8),
          ),
          constraints: const BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.shopping_cart, color: Colors.white, size: 30,),
              Padding(padding: EdgeInsets.all(10), child:Text("New Orders",style: TextStyle(fontFamily: "verdana", fontSize: 18,fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis, color: Colors.white)),),
              Padding(padding: EdgeInsets.all(10), child:Text("10",style: TextStyle(fontFamily: "verdana", color: Colors.white)),),

            ],
          ),
        ),
      ) ,
    );
  }

}