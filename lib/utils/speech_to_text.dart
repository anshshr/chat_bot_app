// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names, unused_import, unnecessary_import

import 'package:chat_bot_app/utils/gemini_services.dart';
import 'package:chat_bot_app/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:avatar_glow/avatar_glow.dart';

class speech_screen extends StatefulWidget {
  const speech_screen({super.key});

  @override
  State<speech_screen> createState() => _speech_screenState();
}

class _speech_screenState extends State<speech_screen> {
  SpeechToText speech_conversion_text = SpeechToText();
  String text = "Hold the button to start speaking";
  var islistening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: islistening,
        duration: Duration(seconds: 2),
        glowColor: const Color.fromARGB(255, 7, 181, 255),
        repeat: true,
        startDelay: Duration(milliseconds: 100),
        child: GestureDetector(
          onTapDown: (details) async {
            if (!islistening) {
              // ignore: unused_local_variable
              var available = await speech_conversion_text.initialize();
              if (available) {
                setState(() {
                  islistening = true;
                  speech_conversion_text.listen(
                    onResult: (result) {
                      setState(() {
                        text = result.recognizedWords;
                      });
                    },
                  );
                });
              }
            }
          },
          onTapUp: (details) {
            setState(() {
              islistening = false;
              speech_conversion_text.stop();
            });
          },
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 35,
            child: Icon(
              islistening ? Icons.pause : Icons.mic,
              color: Pallete.whiteColor,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('SPEECH TO TEXT'),
        centerTitle: true,
        backgroundColor: Colors.purple[100],
      ),
      body: Column(
        children: [
          Lottie.network('https://lottie.host/fe1b972f-1727-46d5-86b9-f464a4f8e690/vUnXtuiFMA.json'),
          SingleChildScrollView(
            child: Container(
              // color: Colors.purple[50],
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height * 0.7,
              padding: EdgeInsetsDirectional.all(10),
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Center(
                child: SingleChildScrollView(
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Cera Pro'),
                  ),
                ),
              )),
          ),
        ],
      ),
    );
  }
}

//Lottie.network('https://lottie.host/fe1b972f-1727-46d5-86b9-f464a4f8e690/vUnXtuiFMA.json'),
