// ignore_for_file: prefer_const_constructors, camel_case_types

import 'dart:async';

import 'package:chat_bot_app/homepage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => home_page(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.network(
        'https://images.wallpaperscraft.com/image/single/blue_backgrounds_solid_65833_168x300.jpg',
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      Center(
        child: Lottie.network(
            'https://lottie.host/6389de2f-30fc-46ff-aa81-6d27c2b357fa/u5kgp1Ci73.json'),
      ),
    ]);
  }
}
