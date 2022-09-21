import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'list.dart';
import 'result.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    home: Homepage(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  var questions = Mylist().questions;
  Map mylist = {};
  List<Map<String, Map>> map = [];
  List map6 = [];
  @override
  Widget build(BuildContext context) {
    void annn(String text, String score) {
      setState(() {
        if (mylist.containsKey(text)) {
          mylist.remove(text);
        } else {
          mylist.addAll({text: score});
        }
      });
    }

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.grey,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                child: Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child:
                            Text(questions[index]['questionText'] as String)))),
            ...(questions[index]['answers'] as List<Map<String, Object>>)
                .map((val) {
              return SizedBox(
                child: InkWell(
                  onTap: () {
                    annn(val['text'] as String, val['score'] as String);
                  },
                  child: Container(
                    color: HexColor((mylist.containsKey(val['text']))
                        ? '#0ffc03'
                        : '#fc0341'),
                    margin: EdgeInsets.all(2),
                    height: 70,
                    width: double.infinity,
                    child: Text(val['text'] as String,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center),
                  ),
                ),
              );
            }),
            SizedBox(
              width: double.infinity,
              child: Expanded(
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepOrange)),
                    onPressed: () {
                      setState(() {
                        index++;

                        var newMap =
                            mylist.map((key, value) => MapEntry(key, value));
                        print(newMap);



                        map.addAll([
                          {
                            'correct': newMap,
                            // 'questionText': {
                            //   questions[index - 1]['questionText']
                            // },
                            // 'rank': {questions[index - 1]['rank']}
                          }
                        ]);
                      });

                      mylist.clear();

                      if (index == questions.length) {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Result(map);
                        }));
                      }
                    },
                    child: Text('next question')),
              ),
            ),
            Text(
              '  setlist',
              style: TextStyle(color: Colors.pink),
            ),
            Text(
              '$map  ',
              style: TextStyle(color: Colors.black87),
            ),
            Text(
              '$mylist',
              style: TextStyle(color: Colors.deepPurple),
            )
          ],
        ),
      ),
    );
  }
}
