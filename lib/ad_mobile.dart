import 'package:flutter/material.dart';

class AdGoogleMobileSpace{
  BuildContext context;
  AdGoogleMobileSpace(this.context);
  create(){
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 70,
      color: Colors.white,
      child: const Center(
        child: Text("GOOGLE ADS MOBILE GOES HERE", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
      ),
    );
  }
}