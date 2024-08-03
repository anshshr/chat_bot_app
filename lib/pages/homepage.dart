// ignore_for_file: prefer_const_constructors, camel_case_types, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unused_import, unnecessary_import, non_constant_identifier_names, unnecessary_string_interpolations, avoid_web_libraries_in_flutter, avoid_print

import 'package:chat_bot_app/pages/features_page.dart';
import 'package:chat_bot_app/theme/pallete.dart';
import 'package:chat_bot_app/pages/textdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../utils/gemini_integration.dart';
import '../utils/gemini_services.dart';
// import 'dart:ui/painting.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final speech_to_text = SpeechToText();
  String lastWords = "";
  // final open_ai_service openaiservice = open_ai_service();
  // String? generated_image_url;
  // String? generated_content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
              child: Text('A.I VIRTUAL ASSISTANT'),
            ),
            leading: Icon(Icons.menu),
            backgroundColor: Color.fromARGB(255, 89, 181, 220)),
        body: SingleChildScrollView(
          child: Stack(children: [
            Lottie.network(
                'https://lottie.host/9dffca76-1660-437b-a8b8-d82038372c1d/pVzzNZkDCm.json',
                height: 1000,
                width: double.maxFinite,
                fit: BoxFit.cover),
            Column(
              children: [
                //virtual assistant animation
                Lottie.network(
                    'https://lottie.host/be973684-d88c-4cb6-83c9-5ab5b42e2bca/WpPPbmifos.json',
                    // 'https://lottie.host/d5124f3c-94fa-4547-9f2f-a9fa1318f2f1/rjo5UcsBmJ.json',
                    height: 220,
                    width: double.infinity,
                    alignment: Alignment.topCenter),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    margin:
                        EdgeInsets.symmetric(horizontal: 40).copyWith(top: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Pallete.blackColor,
                        ),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                    child: Text(
                      'Hello ,How can I help you today??',
                      style: TextStyle(
                        fontSize: 25,
                        color: Pallete.mainFontColor,
                        fontFamily: 'Cera Pro',
                      ),
                    )),
                SizedBox(height: 10),
                //suggetsion text
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Here are the few Features',
                      style: TextStyle(
                          fontFamily: 'Cera Pro',
                          color: Pallete.mainFontColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                //features list
                Column(
                  children: <Widget>[
                    text_field_data(
                        header_text: 'Gemini Pro',
                        description:
                            'The best and the innovative solution to all your problems , here you will all your solutions',
                        col: Pallete.firstSuggestionBoxColor),
                    text_field_data(
                        header_text: 'Smart Voice Assistant',
                        description:
                            'Get the best of both worlds wth a voice assistant powered by Dall-E and CHAT-GPT',
                        col: Pallete.thirdSuggestionBoxColor),
                    text_field_data(
                        header_text: 'Smart speech to text Convertor',
                        description:
                            'The best speech analyzer recording ever word efficiently and converting into  word',
                        col: Pallete.thirdSuggestionBoxColor),
                    text_field_data(
                        header_text: 'Smart Chat Bot',
                        description:
                            'A cool and a efficient way through which you can interact with the bot and get your answers',
                        col: Colors.blue[200])
                  ],
                ),
              ],
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Pallete.firstSuggestionBoxColor,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => feature_part(),
                ));
          },
          child: Icon(Icons.arrow_forward_sharp),
        ));
  }
}
