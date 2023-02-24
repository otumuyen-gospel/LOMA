import 'package:flutter/material.dart';

class StoreCard {
  late String url;
  late String name;
  late String description;
  late String location;
  late Image img;
  BuildContext context;
  double margin = 20;
  StoreCard(this.url, this.name, this.description, this.location, this.context);
  responsiveViewWidth(double margin) {
    double width = 0;
    double viewportWidth = MediaQuery.of(context).size.width;
    if (viewportWidth > 1000) {
      width = (viewportWidth / 4) - margin;
    } else if (viewportWidth > 700) {
      width = (viewportWidth / 3) - margin;
    } else if (viewportWidth > 500) {
      width = (viewportWidth / 2) - margin;
    } else {
      width = (viewportWidth / 1) - margin;
    }
    return width;
  }

  card() {
    return InkWell(
      onTap: () {
        Navigator.popAndPushNamed(context, "/Product");
      }, //take user to order page
      child: Container(
        width: responsiveViewWidth(margin),
        margin: EdgeInsets.only(
          left: (margin / 2),
          right: (margin / 2),
          bottom: 20,
        ),
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 0.1),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: responsiveViewWidth(margin),
              width: responsiveViewWidth(margin),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                image: DecorationImage(
                  image: Image.asset(
                    url,
                  ).image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(name,
                  style: const TextStyle(
                      fontFamily: "verdana",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.blueGrey)),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(description,
                  style: const TextStyle(
                      fontFamily: "verdana", color: Colors.grey)),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 20),
              child: Text(
                "Location : $location",
                style: const TextStyle(
                  fontFamily: "verdana",
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
