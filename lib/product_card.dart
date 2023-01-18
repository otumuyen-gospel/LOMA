import 'dart:io';

import 'package:flutter/material.dart';

class ProductCard{
  late String imageUrl;
  late String name;
  late String description;
  late int likes;
  late String price;
  late String location;
  late Image img;
  BuildContext context;
  ProductCard(this.imageUrl, this.name, this.description, this.likes, this.price, this.location, this.context){
    if(imageUrl.startsWith("http")){
      //network file
      img = Image.network(imageUrl, height: 150,
        width: 300,);
    }else if(imageUrl.startsWith("file")){
      //from system file
      img = Image.file(File(imageUrl), height: 150,
        width: 300,);
    }else{
      //from app
      img = Image.asset(imageUrl, height: 150,
        width: 300,);
    }
  }
  create(){
      return InkWell(
        onTap: (){Navigator.pushNamed(context, "/Order");},//take user to order page
        child: Container(
          alignment: Alignment.topLeft,
          constraints: const BoxConstraints.expand(),
          padding: const EdgeInsets.only(top:10, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              img,
              Padding(padding: const EdgeInsets.only(left: 10,right: 10), child:Text(name,style: const TextStyle(fontFamily: "verdana", fontSize: 20,fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis, color: Colors.blue)),),
              Padding(padding: const EdgeInsets.only(left: 10,right: 10), child:Text(description,style: const TextStyle(fontFamily: "verdana", color: Colors.grey)),),
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