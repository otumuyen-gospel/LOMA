import 'package:flutter/material.dart';

class StoreCard{
  late String url;
  late String name;
  late String description;
  late List<String>keyword;
  late String location;
  late Image img;
  BuildContext context;
  double margin = 20;
  StoreCard(this.url, this.name, this.description, this.keyword, this.location, this.context);
  responsiveViewWidth(double margin) {
    double width = 0;
    double viewportWidth = MediaQuery.of(context).size.width;
    if (viewportWidth > 1000) {
      width = (viewportWidth / 3) - margin;
    } else if(viewportWidth > 500){
      width = (viewportWidth / 2) - margin;
    }else{
      width = viewportWidth;
    }
    return width;
  }
  card(){
    return InkWell(
      onTap: (){Navigator.pushNamed(context, "/Product");},//take user to order page
      child: Container(
        width: responsiveViewWidth(margin),
        margin: EdgeInsets.only(left: (margin/2),right: (margin/2),bottom: 20),
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: responsiveViewWidth(margin),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                image: DecorationImage(
                  image: Image.asset(url,).image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.all(10), child:Text(name,style: const TextStyle(fontFamily: "verdana", fontSize: 20,fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis, color: Colors.blue)),),
            Padding(padding: const EdgeInsets.all(10), child:Text(description,style: const TextStyle(fontFamily: "verdana", color: Colors.grey)),),

            Padding(padding: const EdgeInsets.only(left: 10,right: 10, top: 10, bottom: 20), child:Text("Location : $location",style: const TextStyle(fontFamily: "verdana", color: Colors.redAccent,
              fontSize: 20,fontWeight: FontWeight.bold,),),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for(String tags in keyword)
                  Chip(label: Text(tags,style: const TextStyle(color: Colors.white),), backgroundColor: Colors.blue,),
              ],
            ),
          ],
        ),
      ),
    );
  }

}