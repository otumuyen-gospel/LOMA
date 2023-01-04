import 'dart:async';

import 'package:flutter/material.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
            const HomePage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      child:Image.asset("assets/splash.png"),
    );
  }
}
