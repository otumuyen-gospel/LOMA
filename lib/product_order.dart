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
  responsiveView(double viewportWidth){
    if(viewportWidth > 900){
      return 2;
    }else{
      return 1;
    }
  }
  view(){
    return LayoutBuilder(
      //wrap layout builder in a stream builder widget
      builder: (context, constraint){
        return Wrap(
          direction: Axis.horizontal,
          clipBehavior: Clip.none,
          spacing: 40,
          children: [
            Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: img(imageUrl).image,
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(right: 10),
                child:Text(price,style: Theme.of(context).textTheme.headline4),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: const EdgeInsets.all(20),child:Text(location,style: Theme.of(context).textTheme.headline4),),
                Padding(padding: const EdgeInsets.all(20),child:Text(name,style: Theme.of(context).textTheme.headline3),),
                Padding(padding: const EdgeInsets.all(20),child:Text(description,style: Theme.of(context).textTheme.bodyLarge),),

              ],
            ),
          ],
        );
      },
    );
  }
}