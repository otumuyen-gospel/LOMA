import 'package:flutter/material.dart';

Future<bool> logout(BuildContext context) async {
  return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Logout"),
          content: const Text("Sure you want to Logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "/Product");
              },
              child: const Text("Yes"),
            ),
          ],
        ),
      )) ??
      false;
}
