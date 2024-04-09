// ignore_for_file: prefer_const_constructors, camel_case_types, unnecessary_import, unused_import, non_constant_identifier_names

import 'package:avatar_glow/avatar_glow.dart';
import 'package:chat_bot_app/pallete.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'gemini_integration.dart';
import 'package:get/get.dart';

class gemini_integration extends StatefulWidget {
  const gemini_integration({super.key});

  @override
  State<gemini_integration> createState() => _gemini_integrationState();
}

class _gemini_integrationState extends State<gemini_integration> {
  bool islistening = false;
  SpeechToText speech_conversion_text = SpeechToText();
  final text_cotroller = TextEditingController();
  RxString result = ''.obs;
  String text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: islistening,
        duration: Duration(seconds: 2),
        glowColor: Pallete.thirdSuggestionBoxColor,
        repeat: true,
        startDelay: Duration(milliseconds: 200),
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
                setState(() {
                  result.value = '';
                });
              }
            }
          },
          onTapUp: (details) async {
            setState(() {
              islistening = false;
              speech_conversion_text.stop();
            });
            result.value = await gemini_api.getgeminidata(text);
          },
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 35,
            child: Icon(
              islistening ? Icons.pause : Icons.mic,
              color: Colors.white,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'C H A T B O T',
          style: TextStyle(
              fontFamily: 'Cera Pro',
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
        shadowColor: Color.fromARGB(255, 140, 212, 193),
        backgroundColor: Color.fromARGB(255, 133, 230, 222),
        centerTitle: true,
      ),
      body: Stack(children: [
        Container(
          // color: Colors.purple[50],
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // SizedBox(height: 10),
                // TextField(
                //   controller: text_cotroller,
                //   keyboardType: TextInputType.text,
                //   decoration: InputDecoration(
                //       hintText: 'Enter your questions here??',
                //       label: Text('Enter your question here',
                //           style: TextStyle(
                //               fontFamily: 'Cera Pro',
                //               fontWeight: FontWeight.bold,
                //               fontSize: 20)),
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.all(Radius.circular(20)),
                //           borderSide: BorderSide(
                //               color: Color.fromARGB(255, 75, 60, 60),
                //               width: 20))),
                // ),
                islistening
                    ? Lottie.network(
                        // 'https://lottie.host/d5124f3c-94fa-4547-9f2f-a9fa1318f2f1/rjo5UcsBmJ.json',
                        'https://lottie.host/2ce3cef8-76a0-47f2-99e2-d5597ac524ee/mgCa6Cmyag.json',
                        alignment: Alignment.bottomCenter,
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.maxFinite)
                    : Lottie.network(
                        'https://lottie.host/c4b425d5-54ea-49e8-aa74-5669a9f95ed8/WBSKf5nTD6.json',
                        alignment: Alignment.topCenter,
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.infinity * 0.9,
                      ),
                SizedBox(
                  height: 20,
                ),
                // FloatingActionButton(
                //     onPressed: () async {
                //       result.value =
                //           await gemini_api.getgeminidata(text);
                //     },
                //     child: Text(
                //       'Genrate',
                //       style: TextStyle(fontSize: 20),
                //     )),
                // ElevatedButton(
                //     onPressed: () async {
                //       result.value =
                //           await gemini_api.getgeminidata(text_cotroller.text);
                //     },
                //     child: Text(
                //       'Genrate',
                //       style: TextStyle(fontSize: 20),
                //     )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'User : $text',
                  style: TextStyle(
                      fontFamily: 'Cera Pro',
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                Obx(
                  () => Text(
                    'GEMINI PRO : $result',
                    style: TextStyle(
                        fontFamily: 'Cera Pro',
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
