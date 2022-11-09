import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'drawer.dart';
import 'list.dart';
class Result extends StatelessWidget {
  List<Map<String, Map>> mylist;
  Result(this.mylist);
  @override
  Widget build(BuildContext context) {
    print(mylist[0]['correct']);
    var questions = Mylist().questions;

    // mylist.remove(mylist[0]);
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: mylist.length,
            itemBuilder: (context, index) {
              var ke =
                  (questions[index]['answers'] as List<Map<String, Object>>)
                      .map((val) {
                return val['text'];
              });

              var val =
                  (questions[index]['answers'] as List<Map<String, Object>>)
                      .map((val) {
                return val['score'];
              });

              return Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Container(
                    color: HexColor(
                        ((mylist[index]['correct']!.values.contains('no')))
                            ? '#f52314'
                            : ((mylist[index]['correct']!.values.isEmpty))
                                ? '#141bf5'
                                : '#0ead1e'),
                    height: 100,
                    child: Column(
                      children: [
                        // Text(mylist[index]['correct'].toString()),
                        // Text(mylist[index]['questionText'].toString()),

                        Text(mylist[index]['correct']!.keys.toString()),
                        Text(mylist[index]['correct']!.values.toString()),
                        Text(ke.toString()),
                        Text(val.toString()),
                      ],
                    )),
              );
            }));
  }
}
