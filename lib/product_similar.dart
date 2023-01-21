import 'package:flutter/material.dart';
class ProductSimilar{
  late BuildContext context;
  ProductSimilar(this.context);
  responsiveViewWidth(double margin) {
    double width = 0;
    double viewportWidth = MediaQuery.of(context).size.width;
    if (viewportWidth > 1000) {
      width = (viewportWidth / 4) - margin;
    } else if(viewportWidth > 700){
      width = (viewportWidth / 3) - margin;
    }else if(viewportWidth > 400){
      width = (viewportWidth / 2) - margin;
    }else{
      width = viewportWidth;
    }
    return width;
  }
  responsiveMargin(margin){
    double viewportWidth = MediaQuery.of(context).size.width;
    if(viewportWidth > 400){
      return margin / 2;
    }else{
      return 0.0;
    }
  }
  card(url, description){
    double margin = 20;
      return InkWell(
        onTap: (){},
        child: Container(
          width: responsiveViewWidth(margin),
          margin: EdgeInsets.only(left: responsiveMargin(margin),right: responsiveMargin(margin),top: 40,bottom: 40),
          child: Column(
            children: [
              Container(
                height: responsiveViewWidth(margin),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset(url,).image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.all(5),
                child:Text(description, style:const TextStyle(color: Colors.grey),),),
            ],
          ),
        ),
      );
    }
    show(){
      return Wrap(
        clipBehavior: Clip.none,
        direction: Axis.horizontal,
        children: [
          for(int i =1; i<= 10; i++)
            card("assets/$i.jpg", "Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper",),
        ],
      );
    }

}