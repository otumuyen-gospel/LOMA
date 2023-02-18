import 'package:flutter/material.dart';

Drawer drawer = Drawer(
  //wrap product category listing in a stream builder widget
  child: ListView(
    children: <Widget>[
      DrawerHeader(
        child: Container(
          alignment: Alignment.center,
          height: 100,
          child: Image.asset(
            "assets/logo.png",
            fit: BoxFit.contain,
          ),
        ),
      ),
      ListTile(
        leading: const Icon(
          Icons.photo_camera,
          color: Colors.blue,
        ),
        title: const Text(
          "Photography",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(
          Icons.emoji_food_beverage,
          color: Colors.blue,
        ),
        title: const Text(
          "Food and beverages",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(
          Icons.library_books,
          color: Colors.blue,
        ),
        title: const Text(
          "Books",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(
          Icons.snowshoeing,
          color: Colors.blue,
        ),
        title: const Text(
          "Wears & Shoes",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(
          Icons.computer,
          color: Colors.blue,
        ),
        title: const Text(
          "Computer & Accessories",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(
          Icons.app_shortcut,
          color: Colors.blue,
        ),
        title: const Text(
          "Software Services",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(
          Icons.draw,
          color: Colors.blue,
        ),
        title: const Text(
          "Technical & painting & Artisan Services",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(
          Icons.emoji_transportation,
          color: Colors.blue,
        ),
        title: const Text(
          "Logistics",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(
          Icons.sports,
          color: Colors.blue,
        ),
        title: const Text(
          "Sports and Entertainment",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(
          Icons.print,
          color: Colors.blue,
        ),
        title: const Text(
          "Writing, Printing and Binding",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(
          Icons.miscellaneous_services,
          color: Colors.blue,
        ),
        title: const Text(
          "Other Services",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        onTap: () {},
      ),
    ],
  ),
);
