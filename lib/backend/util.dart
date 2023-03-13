import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:url_launcher/url_launcher.dart';

class Util {
  makingPhoneCall(String phone) async {
    var url = Uri.parse("tel:$phone");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  sendSMS(String phone) async {
    var url = Uri.parse("sms:$phone");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String detectingPlatform() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return "Mobile";
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return "Mobile";
    } else {
      return "Desktop";
    }
  }

  String simple_uuid() {
    StringBuffer sb = StringBuffer();
    String src =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@";
    for (int i = 1; i <= 40; i++) {
      sb.writeCharCode(src.codeUnitAt(Random().nextInt(src.length)));
    }
    return sb.toString();
  }

  Future<String> compressImage(String path) async {
    File file = new File(path);
    try {
      File compressedFile = await FlutterNativeImage.compressImage(file.path,
          quality: 100, percentage: 10);
      return compressedFile.path; // compressed file path
    } catch (e) {
      return file.path; //uncompressed file path
    }
  }
}
