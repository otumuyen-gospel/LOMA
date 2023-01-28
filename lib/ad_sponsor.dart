import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SponsoredAds{
  BuildContext context;
  SponsoredAds(this.context);
  late Image img;
  add(String url, String imageUrl){
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
    return InkWell(
      child:Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.2,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: img.image,
            fit: BoxFit.contain,
          ),
        ),
      ),
      onTap: (){launch(url);}
    );
  }
  getChildren(){
    return //top ads banner wrap slider in StreamBuilder
      CarouselSlider(
        items: [
          SponsoredAds(context).add("https://www.github.com", "assets/1.png"),
          SponsoredAds(context).add("https://www.github.com", "assets/3.png"),
        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height*0.2,
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
  launch(String url) async {
    Uri uri = Uri.parse(Uri.encodeFull(url));
    if(await canLaunchUrl(uri)){
      await launchUrl(uri);
    }else{
      throw "could not launch this ad";
    }
  }
}