import 'dart:io';

import 'package:flutter/material.dart';

class ProductCard{
  late String url;
  late String name;
  late String description;
  late int likes;
  late String price;
  late String location;
  late Image img;
  BuildContext context;
  double margin = 20;
  ProductCard(this.url, this.name, this.description, this.likes, this.price, this.location, this.context){
    if(url.startsWith("http")){
      //network file
      img = Image.network(url);
    }else if(url.startsWith("file")){
      //from system file
      img = Image.file(File(url), height: 150,
        width: 300,);
    }else{
      //from app
      img = Image.asset(url, height: 150,
        width: 300,);
    }
  }
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
      onTap: (){Navigator.pushNamed(context, "/Order");},//take user to order page
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton.icon(
                  onPressed: (){},
                  icon: const Icon(Icons.thumb_up_sharp,color:Colors.blue),
                  label:Text("$likes", style: const TextStyle(color: Colors.blue),),
                  style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1),),
                    foregroundColor: MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1),),
                  ),
                ),
                Padding(padding: const EdgeInsets.only(left:10, right: 10), child:
                Text(price,style: const TextStyle(fontFamily: "verdana", color: Colors.blue)),),
                Padding(padding: const EdgeInsets.only(left:10, right: 10), child:
                Text(location,style: const TextStyle(fontFamily: "verdana", color: Colors.blue,
                    overflow: TextOverflow.ellipsis)),),
              ],
            ),
          ],
        ),
      ),
    );
  }

}