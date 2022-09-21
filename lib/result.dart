import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'correction.dart';
import 'drawer.dart';

class Result extends StatelessWidget {
  List<Map<String, Map>> mylist;
  Result(this.mylist);
  @override
  Widget build(BuildContext context) {
    print(mylist[0]['correct']);
    // mylist.remove(mylist[0]);
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: mylist.length,
        prototypeItem: ListTile(
          title: Text('rrrrrrrrr'),
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return Correction(mylist);
              }));
            },
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                color: HexColor(
                    ((mylist[index] == 'sah')) ? '#0ffc03' : '#fc0341'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: TextButton(
                          onPressed: () {},
                          child: Column(
                            children: [
                              // Text(mylist[index]['correct'].toString()),
                              // Text(mylist[index]['questionText'].toString()),

                              Text(mylist[index]['correct']!.keys.toString()),
                              Text(mylist[index]['correct']!.values.toString()),

                              // Text('$mylist')
                            ],
                          )),
                    ),
                    Text(mylist[index]['rank'].toString()),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
