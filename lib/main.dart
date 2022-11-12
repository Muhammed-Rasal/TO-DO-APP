import 'package:flutter/material.dart';
import 'view/home/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  
  await Hive.initFlutter();
  var box = await Hive.openBox('HiveBox');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    home: const HomeScreen(),
  ));
}
