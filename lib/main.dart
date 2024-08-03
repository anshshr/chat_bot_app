// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import

import 'package:chat_bot_app/pages/homepage.dart';
import 'package:chat_bot_app/theme/pallete.dart';
import 'package:chat_bot_app/pages/spalshscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'flutter demo',
    theme: ThemeData.light(useMaterial3: true).copyWith(scaffoldBackgroundColor: Pallete.whiteColor),
    home: splash_screen(),
  ));
}

