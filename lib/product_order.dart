import 'dart:io';
import 'package:flutter/material.dart';
class ProductOrder{
  late String name,description, imageUrl;
  late String price;
  late String location;
  BuildContext context;
  ProductOrder(this.imageUrl,this.name,this.description, this.price, this.location, this.context);
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
  responsiveViewWidth(double viewportWidth){
    if(viewportWidth > 700){
      return 0.5;
    }else{
      return 1.0;
    }
  }
  responsiveViewHeight(double viewportWidth){
    if(viewportWidth > 700){
      return 0.9;
    }else{
      return 0.5;
    }
  }
  responsiveText(double viewportWidth){
    if(viewportWidth > 700){
      return 40.0;
    }else{
      return 28.0;
    }
  }
  view(){
    return LayoutBuilder(
      builder: (context, constraint){
        return Wrap(
          direction: Axis.horizontal,
          clipBehavior: Clip.none,
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * responsiveViewWidth(constraint.maxWidth),
              height: MediaQuery.of(context).size.height * responsiveViewHeight(constraint.maxWidth),
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    Text(location,style: TextStyle(color: Colors.cyanAccent,
                        fontSize: responsiveText(constraint.maxWidth),letterSpacing: 10, fontStyle: FontStyle.italic)),
                  Text(name,style: TextStyle(color: Colors.pink, fontSize: responsiveText(constraint.maxWidth),
                      letterSpacing: 10)),
                  Text(description,style: const TextStyle(color: Colors.white, fontSize: 15)),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width * responsiveViewWidth(constraint.maxWidth),
              height: MediaQuery.of(context).size.height * 0.9,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: img(imageUrl).image,
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.grey,
                padding: const EdgeInsets.all(10),
                child:Text(price,style: const TextStyle(color: Colors.white, fontSize: 20,
                    letterSpacing: 3, fontStyle: FontStyle.italic)),
              ),
            ),
          ],
        );
      },
    );
  }
}