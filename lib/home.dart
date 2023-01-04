import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("LOMA"),
          leading: null,
          actions: const [],
        ),
        drawer: null,
        body: const Center(
          child: Text("LOCAL MARKET APP"),
        ),
      floatingActionButton: const FloatingActionButton(
        child: null,
        onPressed: null,
      ),
      bottomNavigationBar: null,
    );
  }
}
