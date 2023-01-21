import 'dart:io';
import 'package:flutter/material.dart';
class ProductOrder{
  late String name,description, imageUrl;
  late String price;
  late String location;
  BuildContext context;
  ProductOrder(this.context);
  img(imageUrl){
    Image img;
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
    return img;
  }
  responsiveViewWidth(double margin) {
    double width = 0;
    double viewportWidth = MediaQuery.of(context).size.width;
    if (viewportWidth > 700) {
      width = (viewportWidth / 2) - margin;
    }else{
      width = viewportWidth;
    }
    return width;
  }
  responsiveMargin(margin){
    double viewportWidth = MediaQuery.of(context).size.width;
    if(viewportWidth > 700){
      return margin / 2;
    }else{
      return 0.0;
    }
  }
  responsiveText(){
    double viewportWidth = MediaQuery.of(context).size.width;
    if(viewportWidth > 700){
      return 40.0;
    }else{
      return 28.0;
    }
  }
  view(){
    imageUrl = "assets/1.jpg"; name= "Lorem Ipsum";
    description= "Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper";
    price ="\$100";
    location ="Ipaja";
    double margin = 0;
    return Wrap(
      children: [
        Container(
          alignment: Alignment.topLeft,
          width: responsiveViewWidth(margin),
          height: responsiveViewWidth(margin),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: img(imageUrl).image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: const Color.fromRGBO(0, 0, 255, 0.1),
          width: responsiveViewWidth(margin),
          height: responsiveViewWidth(margin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding:const EdgeInsets.all(10),child:Text(price,style: const TextStyle(color: Colors.black, fontSize: 20,
                  letterSpacing: 3, fontWeight: FontWeight.bold),),),
              Padding(padding:const EdgeInsets.all(10), child:Text(location,style: TextStyle(color: Colors.blueGrey,
                  fontSize: responsiveText(),letterSpacing: 3, fontStyle: FontStyle.italic)),),
              Padding(padding:const EdgeInsets.all(10), child:Text(name,style: TextStyle(color: Colors.blue, fontSize: responsiveText(),
                  letterSpacing: 3)),),
              Padding(padding:const EdgeInsets.all(10), child:Text(description,style: const TextStyle(fontSize: 15)),),
            ],
          ),
        ),
      ],
    );
  }
}