import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main()async{



  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');

}