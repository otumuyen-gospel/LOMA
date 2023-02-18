import 'package:flutter/material.dart';

class Statistics {
  late BuildContext context;
  Statistics(this.context);
  double margin = 20;
  responsiveViewWidth() {
    double width = 0;
    double viewportWidth = MediaQuery.of(context).size.width;
    if (viewportWidth > 500) {
      width = (viewportWidth / 3) - margin;
    } else {
      width = (viewportWidth / 1) - margin;
    }
    return width;
  }

  card(url, route, name, icon, number) {
    return InkWell(
      onTap: () {
        Navigator.popAndPushNamed(context, route);
      },
      child: Container(
        width: responsiveViewWidth(),
        margin: EdgeInsets.only(
            left: (margin / 2), right: (margin / 2), bottom: 20),
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: responsiveViewWidth() / 2,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                image: DecorationImage(
                  image: Image.asset(
                    url,
                  ).image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(
                icon,
                color: Colors.grey,
                size: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(name,
                  style: const TextStyle(
                      fontFamily: "verdana",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey)),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(number,
                  style: const TextStyle(
                      fontFamily: "verdana", color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}
