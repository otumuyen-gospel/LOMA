import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:loma/product.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage>{
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("assets/logo-white.png"),
      title: null,
      showLoader: true,
      backgroundColor: Colors.blue,
      //backgroundImage: Image.asset("assets/cover.png").image,
      loaderColor: Colors.white,
      loadingText: const Text("Loading...", style: TextStyle(color: Colors.white),),
      navigator: const Product(),
      durationInSeconds: 5,
    );
  }
}