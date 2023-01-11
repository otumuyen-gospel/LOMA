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
  ProductCard(this.imageUrl, this.name, this.description, this.likes, this.price, this.location){
    if(imageUrl.startsWith("http")){
      //network file
      img = Image.network(imageUrl,fit: BoxFit.contain);
    }else if(imageUrl.startsWith("file")){
      //from system file
      img = Image.file(File(imageUrl), fit: BoxFit.contain);
    }else{
      //from app
      img = Image.asset(imageUrl, fit: BoxFit.contain);
    }
  }
  create(){
      return Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),),
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: 190,
                  child: img,
                ),
                Text(name,style: const TextStyle(fontFamily: "verdana", fontSize: 20,fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis, color: Colors.blue)),
                Text(description,style: const TextStyle(fontFamily: "verdana", color: Colors.grey)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.thumb_down,color:Colors.white),
                        label:Text("$likes")),
                    ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.shopping_cart,color:Colors.white),
                        label:const Text("Order")),
                    Text(price,style: const TextStyle(fontFamily: "verdana", color: Colors.blue)),
                    Text(location,style: const TextStyle(fontFamily: "verdana", color: Colors.blue,
                    overflow: TextOverflow.ellipsis)),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}