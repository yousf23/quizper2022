import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'test2.dart';
import 'webpage.dart';

import 'list.dart';
import 'result.dart';
import 'home.dart';

Future<void> main() async {
  runApp(MaterialApp(
    home: Homepage(),
  ));

  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');
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

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(2),
                  //   child: Container(
                  //     color: Colors.cyan,
                  //     height: 50,
                  //     width: 50,
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(2),
                  //   child: Row(
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.all(2),
                  //         child: Container(
                  //           color: Colors.cyan,
                  //           height: 50,
                  //           width: 50,
                  //         ),
                  //       ),
                  //       Container(
                  //         color: Colors.cyan,
                  //         height: 50,
                  //         width: 50,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(8)),
                      ),
                      height: 50,
                    ),
                  ),

                  Expanded(
                    flex: 4,
                    child: Container(
                      color: Colors.green,
                      child: Align(
                          child: Text(
                        'السؤال رقم 23',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )),
                      height: 50,
                    ),
                  ),

                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(8)),
                      ),
                      child: Align(
                          child: Text(
                        'السلسة رقم 23',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )),
                      height: 50,
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 3),
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      'https://www.capital.fr/imgre/fit/https.3A.2F.2Fi.2Epmdstatic.2Enet.2Fbin.2F2021.2F07.2F16.2Fa803400d-f4e0-402c-b43d-ef34e95c71a3.2Ejpeg/1120x747/quality/80/thumbnail.jpeg',
                    ),
                  ),
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  child: Expanded(
                      child: Container(
                          alignment: Alignment.center,
                          child: Text(
                              questions[index]['questionText'] as String)))),
              Row(
                children: [
                  ...(questions[index]['answers'] as List<Map<String, Object>>)
                      .map((val) {
                    return Expanded(
                      child: SizedBox(
                        child: InkWell(
                          onTap: () {
                            annn(val['text'] as String, val['score'] as String);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: HexColor(
                                    (mylist.containsKey(val['text']))
                                        ? '#0ffc03'
                                        : '#fc0341'),
                                borderRadius: BorderRadius.circular(6)),
                            margin: EdgeInsets.all(2),
                            height: 70,
                            width: 70,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(val['text'] as String,
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          mylist.clear();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          height: 70,
                          child: Align(
                              alignment: Alignment.center,
                              child: Text('تصحيح',style: TextStyle(fontSize: 15, color: Colors.white),)),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {
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
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return Result(map);
                        }));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(6)),
                        height: 70,
                        child: Align(
                            alignment: Alignment.center, child: Text('تأكيد',style: TextStyle(fontSize: 15, color: Colors.white),)),
                      ),
                    ),
                  ))
                ],
              ),
              // SizedBox(
              //   width: double.infinity,
              //   child: Expanded(
              //     child: ElevatedButton(
              //         style: ButtonStyle(
              //             backgroundColor:
              //                 MaterialStateProperty.all(Colors.deepOrange)),
              //         onPressed: () {
              //           setState(() {
              //             index++;
              //
              //             var newMap =
              //                 mylist.map((key, value) => MapEntry(key, value));
              //             print(newMap);
              //
              //             map.addAll([
              //               {
              //                 'correct': newMap,
              //                 // 'questionText': {
              //                 //   questions[index - 1]['questionText']
              //                 // },
              //                 // 'rank': {questions[index - 1]['rank']}
              //               }
              //             ]);
              //           });
              //
              //           mylist.clear();
              //
              //           if (index == questions.length) {
              //             Navigator.of(context)
              //                 .push(MaterialPageRoute(builder: (_) {
              //               return Result(map);
              //             }));
              //           }
              //         },
              //         child: Text('next question')),
              //   ),
              // ),
              // Text(
              //   '  setlist',
              //   style: TextStyle(color: Colors.pink),
              // ),
              // Text(
              //   '$map  ',
              //   style: TextStyle(color: Colors.black87),
              // ),
              // Text(
              //   '$mylist',
              //   style: TextStyle(color: Colors.deepPurple),
              // ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return WebPage();
                    }));
                  },
                  child: Text('move tooooo web page')),


              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Test2();
                    }));
                  },
                  child: Text('test'))
            ],
          ),
        ),
      ),
    );
  }
}

//hey youssef
