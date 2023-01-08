import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductSlider{
  late Image img;
  add(String url, String imageUrl){
    if(imageUrl.startsWith("http")){
      //network file
      img = Image.network(imageUrl,fit: BoxFit.cover);
    }else if(imageUrl.startsWith("file")){
      //from system file
      img = Image.file(File(imageUrl),fit: BoxFit.cover);
    }else{
      //from app
      img = Image.asset(imageUrl,fit: BoxFit.cover);
    }
    return InkWell(
      child:Container(
        margin: const EdgeInsets.all(8.0),
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: img.image,
          ),
        ),
      ),
      onTap: ()=>launchUrl(url),
    );
  }
  getChildren(){
    return //top ads banner wrap slider in StreamBuilder
      CarouselSlider(
        items: [
          ProductSlider().add("https://www.github.com", "assets/1.png"),
          ProductSlider().add("https://www.github.com", "assets/2.png"),
          ProductSlider().add("https://www.github.com", "assets/3.png"),
          ProductSlider().add("https://www.github.com", "assets/cover.png"),
        ],
        options: CarouselOptions(
          height: 200,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.bounceIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 1.0,
        ),
      );
  }
  launchUrl(String url) async {
    if(await canLaunchUrl(Uri.parse(url))){
      await launchUrl(url);
    }else{
      throw "could not launch this ad";
    }
  }
}