import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Test2 extends StatefulWidget {
  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  final _box2 = Hive.box('mybox');

  void writedata() {
    _box2.put(1, 'youssef');

    _box2.put(2, '1111111');
    _box2.put(3, '22222222222');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                writedata();
              },
              child: Text('write')),
          ElevatedButton(
              onPressed: () {}, child: Text(_box2.values.toString())),
          ElevatedButton(
              onPressed: () {
                _box2.delete(1);
              },
              child: Text('delete')),
        ],
      ),
    );
  }
}
