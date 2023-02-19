import 'package:flutter/material.dart';

getDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: Image.asset("assets/1.jpg").image,
            ),
            title: const Text(
              "Profile Name",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            subtitle: const Text(
              "Profile description",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop(false); //close sidebar
              if (ModalRoute.of(context)?.settings.name != "/Account") {
                Navigator.popAndPushNamed(context, "/Account");
              }
            },
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.dashboard,
            color: Colors.blue,
          ),
          title: const Text(
            "Home",
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          onTap: () {
            Navigator.of(context).pop(false); //close sidebar
            if (ModalRoute.of(context)?.settings.name != "/Dashboard") {
              Navigator.popAndPushNamed(context, "/Dashboard");
            } else {
              Navigator.popAndPushNamed(context, "/Product");
            }
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.location_on,
            color: Colors.blue,
          ),
          title: const Text(
            "Manage Location",
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          onTap: () {
            Navigator.of(context).pop(false); //close sidebar
            if (ModalRoute.of(context)?.settings.name != "/Location") {
              Navigator.popAndPushNamed(context, "/Location");
            }
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.manage_accounts,
            color: Colors.blue,
          ),
          title: const Text(
            "Manage Account",
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          onTap: () {
            Navigator.of(context).pop(false); //close sidebar
            if (ModalRoute.of(context)?.settings.name != "/Account") {
              Navigator.popAndPushNamed(context, "/Account");
            }
          },
        ),
        const Divider(color: Colors.grey),
        ListTile(
          leading: const Icon(
            Icons.store,
            color: Colors.blue,
          ),
          title: const Text(
            "Your Store",
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          onTap: () {
            Navigator.of(context).pop(false); //close sidebar
            if (ModalRoute.of(context)?.settings.name != "/Store") {
              Navigator.popAndPushNamed(context, "/Store");
            }
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.emoji_food_beverage,
            color: Colors.blue,
          ),
          title: const Text(
            "New Product",
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          onTap: () {
            Navigator.of(context).pop(false); //close sidebar
            if (ModalRoute.of(context)?.settings.name != "/NewProduct") {
              Navigator.popAndPushNamed(context, "/NewProduct");
            }
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.list,
            color: Colors.blue,
          ),
          title: const Text(
            "Manage Products List",
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          onTap: () {
            Navigator.of(context).pop(false); //close sidebar
            if (ModalRoute.of(context)?.settings.name != "/ProductListing") {
              Navigator.popAndPushNamed(context, "/ProductListing");
            }
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.book,
            color: Colors.blue,
          ),
          title: const Text(
            "Orders",
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          onTap: () {
            Navigator.of(context).pop(false); //close sidebar
            if (ModalRoute.of(context)?.settings.name != "/Orders") {
              Navigator.popAndPushNamed(context, "/Orders");
            }
          },
        ),
      ],
    ),
  );
}
