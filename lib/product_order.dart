import 'dart:io';
import 'package:flutter/material.dart';

class ProductOrder {
  late String name, description, imageUrl;
  late String price;
  late String location;
  BuildContext context;
  ProductOrder(this.context);
  img(imageUrl) {
    Image img;
    if (imageUrl.startsWith("http")) {
      //network file
      img = Image.network(imageUrl);
    } else if (imageUrl.startsWith("file")) {
      //from system file
      img = Image.file(File(imageUrl));
    } else {
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
    } else {
      width = viewportWidth;
    }
    return width;
  }

  responsiveMargin(margin) {
    double viewportWidth = MediaQuery.of(context).size.width;
    if (viewportWidth > 700) {
      return margin / 2;
    } else {
      return 0.0;
    }
  }

  responsiveText() {
    double viewportWidth = MediaQuery.of(context).size.width;
    if (viewportWidth > 700) {
      return 60.0;
    } else {
      return 28.0;
    }
  }

  responsiveText2() {
    double viewportWidth = MediaQuery.of(context).size.width;
    if (viewportWidth > 700) {
      return 35.0;
    } else {
      return 15.0;
    }
  }

  view() {
    imageUrl = "assets/5.jpg";
    name = "Lorem Ipsum";
    description =
        "Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper";
    List keyword = ["Business", "Establishment", "Shoes \$ Wears"];
    return Wrap(
      children: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: img(imageUrl).image,
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            color: const Color.fromRGBO(25, 50, 80, 0.8),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 40),
                  child: Text(name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: responsiveText(),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                  child: Text(description,
                      style: TextStyle(
                          color: Colors.white, fontSize: responsiveText2())),
                ),
                Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  children: [
                    for (String tags in keyword)
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Chip(
                          label: Text(
                            tags,
                            style: const TextStyle(color: Colors.blueGrey),
                          ),
                          backgroundColor: Colors.white,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
