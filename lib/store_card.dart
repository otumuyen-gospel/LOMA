import 'dart:io';

import 'package:flutter/material.dart';

class StoreCard{
  late String imageUrl;
  late String name;
  late String description;
  late List<String>keyword;
  late String location;
  late Image img;
  BuildContext context;
  StoreCard(this.imageUrl, this.name, this.description, this.keyword, this.location, this.context){

    if(imageUrl.startsWith("http")){
      //network file
      img = Image.network(imageUrl);
    }else if(imageUrl.startsWith("file")){
      //from system file
      img = Image.file(File(imageUrl));
    }else{
      //from app
      img = Image.asset(imageUrl);
    }
  }
  create(){
    return InkWell(
      onTap: (){Navigator.pushNamed(context, "/Product");},
      child: Container(
        alignment: Alignment.topLeft,
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image:  DecorationImage(
            image: img.image,
            fit: BoxFit.cover,
          ),
        ),
        child:Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 150, 0.4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(name,style: const TextStyle(fontFamily: "verdana", fontSize: 24,fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis, color: Colors.white)),
              Text(description,style: const TextStyle(fontFamily: "verdana", color: Colors.white,
                fontWeight: FontWeight.bold,)),
              Text("Location : $location",style: const TextStyle(fontFamily: "verdana", color: Colors.redAccent,
                fontSize: 20,fontWeight: FontWeight.bold,),),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for(String tags in keyword)
                    Chip(label: Text(tags,style: const TextStyle(color: Colors.white),), backgroundColor: Colors.blue,),
                ],
              ),
            ],
          ),
        ) ,
      ),
    );

  }
}