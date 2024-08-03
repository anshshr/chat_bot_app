// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names

import 'package:chat_bot_app/theme/pallete.dart';
import 'package:flutter/material.dart';

class text_field_data extends StatelessWidget {
  final String header_text;
  final String description;
  final Color? col;

  const text_field_data(
      {super.key,
      required this.header_text,
      required this.description,
      required this.col});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
          color: col, borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 10,left: 15),
              child: Text(header_text,
                  style: TextStyle(
                      fontFamily: 'Cera Pro',
                      fontSize: 23,
                      color: Pallete.blackColor,
                      fontWeight: FontWeight.bold),
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20).copyWith(left: 15),
            child: Text(description,style: TextStyle(fontFamily: 'Cera Pro',fontSize:15 ),),
          )
        ],
      ),
    );
  }
}
