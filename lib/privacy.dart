import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});
  Future<Object> _pushPage(BuildContext context) async {
    return Navigator.popAndPushNamed(context, "/Order");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _pushPage(context);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text(
            "Terms and Conditions",
            style: TextStyle(color: Colors.blue),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/Order");
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.blue,
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 50, bottom: 50),
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.center,
              child: const Text.rich(
                TextSpan(
                  text: "Privacy Policy",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.center,
              child: const Text.rich(
                TextSpan(
                  text:
                      "Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.center,
              child: const Text.rich(
                TextSpan(
                  text: "Terms & Conditions",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.center,
              child: const Text.rich(
                TextSpan(
                  text:
                      "Lorem ipsum dolor sit amet consectetur adipiscing enterdum ullamcorper",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.center,
              child: const Text.rich(
                TextSpan(
                  text: "About & Help",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.center,
              child: const Text.rich(
                TextSpan(
                  text:
                      "Lorem ipsum dolor sit amet consectetur adipiscing elit Morbi egestas lectus non diam interdum ullamcorper",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
