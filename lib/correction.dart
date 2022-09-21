import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'list.dart';
import 'package:hexcolor/hexcolor.dart';

class Correction extends StatelessWidget {
  int index2 = 0;

  List mylist;
  Correction(this.mylist);
  var questions = Mylist().questions;
  @override
  Widget build(BuildContext context) {
    var list = (questions[index2]['answers'] as List);
    print(list);
    return Scaffold(
      appBar: AppBar(),
      body: Row(children: [
        Column(
          children: [Text(mylist[0]['correct'].toString())],
        ),
        Column(
          children: [
            Text(
              questions[index2]['questionText'] as String,
            ),
            Text(
              list[0]['text'],
              style: TextStyle(
                  color: HexColor(
                      ((list[0]['score'] == 'sah')) ? '#0ffc03' : '#fc0341')),
            ),
            Text(
              list[1]['text'],
              style: TextStyle(
                  color: HexColor(
                      ((list[1]['score'] == 'sah')) ? '#0ffc03' : '#fc0341')),
            ),
            Text(
              list[2]['text'],
              style: TextStyle(
                  color: HexColor(
                      ((list[2]['score'] == 'sah')) ? '#0ffc03' : '#fc0341')),
            ),
            Text(
              list[3]['text'],
              style: TextStyle(
                  color: HexColor(
                      ((list[3]['score'] == 'sah')) ? '#0ffc03' : '#fc0341')),
            ),
          ],
        ),
      ]),
    );
  }
}
