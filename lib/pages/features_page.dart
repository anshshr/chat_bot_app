// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, unnecessary_import

import 'package:chat_bot_app/utils/gemini_services.dart';
import 'package:chat_bot_app/theme/pallete.dart';
import 'package:chat_bot_app/utils/speech_to_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import '../chat_bot.dart';

class feature_part extends StatefulWidget {
  const feature_part({super.key});

  @override
  State<feature_part> createState() => _feature_partState();
}

class _feature_partState extends State<feature_part> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'OUR FEATURES ',
            style: TextStyle(
                fontFamily: 'Cera Pro',
                fontWeight: FontWeight.bold,
                fontSize: 23),
          ),
          centerTitle: false,
          backgroundColor: Colors.purple[50],
        ),
        body: Stack(children: [
          Lottie.network(
              'https://lottie.host/281e185b-90f6-458a-abbb-b012c0e91005/KSDuGXXNCI.json',
              height: double.maxFinite,
              width: double.maxFinite,
              fit: BoxFit.cover),
          // Image.network(
          //   'https://i.pinimg.com/564x/af/c2/e1/afc2e1b02e1644b0e31828e5b0cb2f6a.jpg',
          //   height: 1000,
          //   width: 1000,
          //   fit: BoxFit.cover,
          // ),
          Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(13),
                    height: 150,
                    width: MediaQuery.of(context).size.width * 0.44,
                    decoration: BoxDecoration(
                        color: Pallete.firstSuggestionBoxColor,
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => gemini_integration(),
                                  ));
                            },
                            child: Lottie.network(
                                'https://lottie.host/1535f809-21af-4f1a-a04b-90d6d74a590b/1kaBv19Sq8.json',
                                height: 70,
                                width: 160),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Generative A.I.',
                            style: TextStyle(
                                fontFamily: 'Cera Pro',
                                fontWeight: FontWeight.bold,
                                fontSize: 23),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    height: 150,
                    width: MediaQuery.of(context).size.width * 0.44,
                    decoration: BoxDecoration(
                        color: Pallete.secondSuggestionBoxColor,
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(1),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => speech_screen(),
                                    ));
                              },
                              child: Lottie.network(
                                  'https://lottie.host/dc8501e5-a90a-4701-936a-c44018e23157/ULy2njCGlo.json',
                                  height: 75,
                                  width: 160)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Speech To Text',
                            style: TextStyle(
                                fontFamily: 'Cera Pro',
                                fontWeight: FontWeight.bold,
                                fontSize: 23),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15),
                    height: 150,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                        color: Pallete.thirdSuggestionBoxColor,
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(7),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => chat_bot(),
                                    ));
                              },
                              child: Lottie.network(
                                  'https://lottie.host/cf20e7b1-7f02-47b5-a0d7-7ea98aced5ce/xXd4z5sd0b.json',
                                  height: 75,
                                  width: 160)
                              // Image.asset(
                              //   'lib/icon/stt.png',
                              //   height: 50,
                              //   width: 50,
                              // ),
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'Chat Bot',
                            style: TextStyle(
                                fontFamily: 'Cera Pro',
                                fontWeight: FontWeight.bold,
                                fontSize: 23),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ]));
  }
}
