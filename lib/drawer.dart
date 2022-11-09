import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('hey'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return Homepage();
              }));
            },
          ),
          Divider(),
          ListTile(
            title: Text('hey'),
          ),
        ],
      ),
    );
  }
}
