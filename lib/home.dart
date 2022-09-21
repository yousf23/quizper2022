import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';
import 'main.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget cont_fun(Color mm, String ss, Widget ff) {
      return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return ff;
          }));
        },
        child: Container(
          alignment: Alignment.center,
          child: Text(ss),
          decoration: BoxDecoration(
            color: mm,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(),
        drawer: MyDrawer(),
        body: GridView(
          padding: EdgeInsets.all(4),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1 / 1.5,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
          children: [
            cont_fun(Colors.green, 'hey', MyApp()),
            cont_fun(Colors.cyan, 'hey', MyApp()),
          ],
        ));
  }
}
