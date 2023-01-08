import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SponsoredAds{
  late Image img;
  add(String url, String imageUrl){
    if(imageUrl.startsWith("http")){
      //network file
      img = Image.network(imageUrl,fit: BoxFit.scaleDown, height: 150,);
    }else if(imageUrl.startsWith("file")){
      //from system file
      img = Image.file(File(imageUrl),fit: BoxFit.scaleDown, height: 150,);
    }else{
      //from app
      img = Image.asset(imageUrl,fit: BoxFit.scaleDown, height: 150,);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          alignment: Alignment.center,
          color: const Color.fromRGBO(240, 240, 240, 1),
          child: InkWell(
            child: Banner(
              message: "Sponsored",
              location: BannerLocation.bottomEnd,
              child: img,
            ),
            onTap: ()=>launchUrl(url),
          ),
        )
      ],
    );
  }
  getChildren(){
    return //top ads banner wrap slider in StreamBuilder
      CarouselSlider(
        items: [
          SponsoredAds().add("https://www.github.com", "assets/1.png"),
          SponsoredAds().add("https://www.github.com", "assets/2.png"),
          SponsoredAds().add("https://www.github.com", "assets/3.png"),
          SponsoredAds().add("https://www.github.com", "assets/cover.png"),
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