import 'package:flutter/material.dart';
class ProductMore{
  card(url, name, description){
    return InkWell(
      onTap: (){},
      child: Container(
        width: 300,
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset(url,).image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.all(5), child:Text(name, style: const TextStyle(fontSize: 20, color: Colors.blue),),),
            Padding(padding: const EdgeInsets.all(5), child:Text(description, style:const TextStyle(color: Colors.blueGrey),),),
          ],
        ),
      ),
    );
  }
  show(){
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(top: 40, bottom: 40),
        clipBehavior: Clip.none,
        primary: true,
        child: Row(
          children: [
            for(int i = 1; i< 10; i++)
              card("assets/$i.jpg", "Lorem Ipsum", "Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper"),
          ],
        ),
    );
  }
}