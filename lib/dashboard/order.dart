import 'package:flutter/material.dart';

class Order {
  late BuildContext context;
  Order(this.context);
  responsiveViewWidth() {
    double width = MediaQuery.of(context).size.width;
    if (width > 500) {
      return MediaQuery.of(context).size.width * 0.7; // seventy percent
    } else {
      return MediaQuery.of(context).size.width * 1; // hundred percent
    }
  }

  double responsiveText() {
    double width = MediaQuery.of(context).size.width;
    if (width > 500) {
      return 18;
    } else {
      return 13;
    }
  }

  double responsiveMargin() {
    if (MediaQuery.of(context).size.width > 500) {
      return MediaQuery.of(context).size.width * 0.15; // fifteen percent
    } else {
      return 0; // zero percent
    }
  }

  card(id, date, qty, name, url, description, recipientName, recipientEmail,
      recipientAddress, recipientPhone) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: responsiveViewWidth(),
        margin: EdgeInsets.only(
            left: responsiveMargin(), right: responsiveMargin(), bottom: 20),
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(bottom: 30),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: responsiveViewWidth(),
              color: Colors.blue,
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 15,
                children: [
                  Text(
                    date.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsiveText(),
                    ),
                  ),
                  Text(
                    "QTY : $qty",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsiveText(),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.center,
                child: Text(name,
                    style: const TextStyle(
                        fontFamily: "verdana",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  url,
                  height: 150,
                  width: 300,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.center,
                child: Text(description),
              ),
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              children: [
                const Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 24,
                ),
                Text(
                  recipientName,
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w100),
                ),
              ],
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              children: [
                const Icon(
                  Icons.email,
                  color: Colors.blue,
                  size: 24,
                ),
                Text(
                  recipientEmail,
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w100),
                ),
              ],
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              children: [
                const Icon(
                  Icons.phone,
                  color: Colors.blue,
                  size: 24,
                ),
                Text(
                  recipientPhone,
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w100),
                ),
              ],
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              children: [
                const Icon(
                  Icons.location_city,
                  color: Colors.blue,
                  size: 24,
                ),
                Text(
                  recipientAddress,
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w100),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
