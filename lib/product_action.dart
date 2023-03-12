import 'package:flutter/material.dart';
import 'package:loma/backend/util.dart';

class ProductActions {
  Util util = Util();
  _callButton(String phone) {
    if (util.detectingPlatform() == "Mobile") {
      return ElevatedButton.icon(
        onPressed: () {
          util.makingPhoneCall(phone);
        },
        icon: const Icon(Icons.phone, color: Colors.blue),
        label: const Text(
          "Call",
          style: TextStyle(color: Colors.blue),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromRGBO(255, 255, 255, 1),
          ),
          foregroundColor: MaterialStateProperty.all(
            const Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
      );
    } else {
      return Row(
        children: [
          const Icon(
            Icons.phone,
            color: Colors.blue,
            size: 20,
          ),
          Text(
            phone,
            style: const TextStyle(fontSize: 20, color: Colors.blue),
          ),
        ],
      );
    }
  }

  _smsButton(String phone) {
    if (util.detectingPlatform() == "Mobile") {
      return ElevatedButton.icon(
        onPressed: () {
          util.sendSMS(phone);
        },
        icon: const Icon(Icons.message, color: Colors.blue),
        label: const Text(
          "Message",
          style: TextStyle(color: Colors.blue),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromRGBO(255, 255, 255, 1),
          ),
          foregroundColor: MaterialStateProperty.all(
            const Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
      );
    } else {
      return null;
    }
  }

  view(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(40),
        clipBehavior: Clip.none,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.money),
                label: Text("\$1000"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.location_on),
                label: Text("IPAJA"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up_sharp, color: Colors.blue),
                label: const Text(
                  "20",
                  style: TextStyle(color: Colors.blue),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  foregroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/OrderForm");
                },
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                label: const Text(
                  "Order",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: _callButton("08053109419"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: _smsButton("08053109419"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/Privacy");
                },
                icon: const Icon(Icons.privacy_tip, color: Colors.blue),
                label: const Text(
                  "Term & Conditions",
                  style: TextStyle(color: Colors.blue),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  foregroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
