import 'package:flutter/material.dart';

class Category {
  late BuildContext context;
  int storeId;
  String category;
  Category(this.context, this.storeId, this.category);
  double margin = 20;
  responsiveViewWidth() {
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

  responsiveText(context) {
    double viewportWidth = MediaQuery.of(context).size.width;
    if (viewportWidth > 700) {
      return 30.0;
    } else {
      return 18.0;
    }
  }

  fetch() {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          categoryUI(),
          //list of products of product
          product(
              "assets/1.jpg",
              "Lorem Ipsum",
              "Lorem ipsum dolor sit amet consectetur adipiscing"
                  " elit Morbi egestas lectus non diam interdum ullamcorper",
              100,
              1),
          product(
              "assets/2.jpg",
              "Lorem Ipsum",
              "Lorem ipsum dolor sit amet consectetur adipiscing"
                  " elit Morbi egestas lectus non diam interdum ullamcorper",
              100,
              1),
          product(
              "assets/3.jpg",
              "Lorem Ipsum",
              "Lorem ipsum dolor sit amet consectetur adipiscing"
                  " elit Morbi egestas lectus non diam interdum ullamcorper",
              100,
              1),
          product(
              "assets/4.jpg",
              "Lorem Ipsum",
              "Lorem ipsum dolor sit amet consectetur adipiscing"
                  " elit Morbi egestas lectus non diam interdum ullamcorper",
              100,
              1),
          product(
              "assets/5.jpg",
              "Lorem Ipsum",
              "Lorem ipsum dolor sit amet consectetur adipiscing"
                  " elit Morbi egestas lectus non diam interdum ullamcorper",
              100,
              1),
          product(
              "assets/6.jpg",
              "Lorem Ipsum",
              "Lorem ipsum dolor sit amet consectetur adipiscing"
                  " elit Morbi egestas lectus non diam interdum ullamcorper",
              100,
              1),
          product(
              "assets/7.jpg",
              "Lorem Ipsum",
              "Lorem ipsum dolor sit amet consectetur adipiscing"
                  " elit Morbi egestas lectus non diam interdum ullamcorper",
              100,
              1),
        ],
      ),
    );
  }

  categoryUI() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 20,
        children: [
          Text(
            category.toUpperCase(),
            style: TextStyle(
                fontSize: responsiveText(context), fontWeight: FontWeight.w100),
          ),
          const Divider(
            thickness: 0.7,
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }

  product(url, name, description, likes, id) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: responsiveViewWidth(),
        margin: EdgeInsets.only(
            left: (margin / 2), right: (margin / 2), top: 20, bottom: 20),
        alignment: Alignment.topCenter,
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
              child: Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 15,
                children: [
                  const Text(
                    "\$100",
                    style: TextStyle(color: Colors.black),
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(
                        Icons.thumb_up_sharp,
                        color: Colors.blue,
                      ),
                      Text(
                        "$likes",
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/ProductUpdate");
                    },
                    child: const Text("Update"),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(name,
                  style: const TextStyle(
                      fontFamily: "verdana",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(description,
                  style: const TextStyle(
                    fontFamily: "verdana",
                    fontSize: 13,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
