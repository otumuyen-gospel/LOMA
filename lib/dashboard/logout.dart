import 'package:flutter/material.dart';

Future<Object> logout(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Logout"),
      content: const Text("Sure you want to Logout?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false); // close dialog
          },
          child: const Text("No"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false); //close dialog
            Navigator.of(context).popAndPushNamed("/Product");
          },
          child: const Text("Yes"),
        ),
      ],
    ),
  );
}
