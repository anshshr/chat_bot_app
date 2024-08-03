// // ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors, camel_case_types, unnecessary_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';
import 'utils/gemini_integration.dart';


class chat_bot extends StatefulWidget {
  const chat_bot({super.key});

  @override
  State<chat_bot> createState() => _chat_botState();
}

class _chat_botState extends State<chat_bot> {
  final text_cotroller = TextEditingController();
  RxString result = ''.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CHAT WITH A.I.'),
        centerTitle: true,
        backgroundColor: Colors.purple[100],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Lottie.network(
                  'https://lottie.host/e393d8ae-6838-4206-a1de-ed8aea4dc0ab/lQNFkVvPxO.json',
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width),
              TextField(
                controller: text_cotroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: 'Enter your Question??',
                    label: Text('Eneter your Question'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ))),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    result.value =
                        await gemini_api.getgeminidata(text_cotroller.text);
                    setState(() {
                      text_cotroller.text = "";
                    });
                  },
                  child: Text(
                    'Genrate Response',
                    style: TextStyle(fontSize: 20, fontFamily: 'Cera Pro'),
                  )),
              SizedBox(
                height: 20,
              ),
              Obx(
                () => Text(
                  result.value,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Cera Pro',
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
