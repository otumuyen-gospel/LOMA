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
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey, width: 0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.emoji_food_beverage, color: Colors.blue, size: 30,),
            Padding(padding: EdgeInsets.only(left: 10,right: 10), child:Text("Products",style: TextStyle(fontFamily: "verdana", fontSize: 18,fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis, color: Colors.blue)),),
            Padding(padding: EdgeInsets.only(left: 10,right: 10), child:Text("10",style: TextStyle(fontFamily: "verdana", color: Colors.blue)),),

          ],
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
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey, width: 0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.search, color: Colors.blue, size: 30,),
            Padding(padding: EdgeInsets.only(left: 10,right: 10), child:Text("Daily Search",style: TextStyle(fontFamily: "verdana", fontSize: 18,fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis, color: Colors.blue)),),
            Padding(padding: EdgeInsets.only(left: 10,right: 10), child:Text("10",style: TextStyle(fontFamily: "verdana", color: Colors.blue)),),

          ],
        ),
      ) ,
    );
  }
  order(){
    return InkWell(
      onTap: (){},// Goto order
      child:Container(
        width: responsiveViewWidth(),
        height: MediaQuery.of(context).size.height/2.2,
        margin: EdgeInsets.only(left: (margin/2),right: (margin/2),bottom: 20),
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.shopping_cart, color: Colors.blue, size: 30,),
            Padding(padding: EdgeInsets.only(left: 10,right: 10), child:Text("New Order",style: TextStyle(fontFamily: "verdana", fontSize: 18,fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis, color: Colors.blue)),),
            Padding(padding: EdgeInsets.only(left: 10,right: 10), child:Text("1",style: TextStyle(fontFamily: "verdana", color: Colors.blue)),),

          ],
        ),
      ) ,
    );
  }
  likes(){
    return InkWell(
      onTap: (){},// Goto likes
      child:Container(
        width: responsiveViewWidth(),
        height: MediaQuery.of(context).size.height/2.2,
        margin: EdgeInsets.only(left: (margin/2),right: (margin/2),bottom: 20),
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.thumb_up, color: Colors.blue, size: 30,),
            Padding(padding: EdgeInsets.only(left: 10,right: 10), child:Text("New Likes",style: TextStyle(fontFamily: "verdana", fontSize: 18,fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis, color: Colors.blue)),),
            Padding(padding: EdgeInsets.only(left: 10,right: 10), child:Text("10",style: TextStyle(fontFamily: "verdana", color: Colors.blue)),),

          ],
        ),
      ) ,
    );
  }
  messages(){
    return InkWell(
      onTap: (){},// Goto products
      child:Container(
        width: responsiveViewWidth(),
        height: MediaQuery.of(context).size.height/2.2,
        margin: EdgeInsets.only(left: (margin/2),right: (margin/2),bottom: 20),
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.sms, color: Colors.blue, size: 30,),
            Padding(padding: EdgeInsets.only(left: 10,right: 10), child:Text("New Sms",style: TextStyle(fontFamily: "verdana", fontSize: 18,fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis, color: Colors.blue)),),
            Padding(padding: EdgeInsets.only(left: 10,right: 10), child:Text("10",style: TextStyle(fontFamily: "verdana", color: Colors.blue)),),

          ],
        ),
      ) ,
    );
  }
  calls(){
    return InkWell(
      onTap: (){},// Goto products
      child:Container(
        width: responsiveViewWidth(),
        height: MediaQuery.of(context).size.height/2.2,
        margin: EdgeInsets.only(left: (margin/2),right: (margin/2),bottom: 20),
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.phone, color: Colors.blue, size: 30,),
            Padding(padding: EdgeInsets.only(left: 10,right: 10), child:Text("Recent Call",style: TextStyle(fontFamily: "verdana", fontSize: 18,fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis, color: Colors.blue)),),
            Padding(padding: EdgeInsets.only(left: 10,right: 10), child:Text("10",style: TextStyle(fontFamily: "verdana", color: Colors.blue)),),

          ],
        ),
      ) ,
    );
  }
}