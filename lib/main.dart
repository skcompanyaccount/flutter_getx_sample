import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/navigation_example.dart';
import 'pages/basic_example.dart';
import 'pages/class_example.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context)=>GetMaterialApp(
      title: "Flutter GetX Sample",
      initialRoute: '/navigationExample',
      routes: routes,
      theme: ThemeData(
          primaryColor: Colors.grey[200]
      )
  );

  Map<String, WidgetBuilder> get routes=>{
    '/navigationExample':(context)=>NavigationExample(),
    '/basicExample':(context)=>BasicExample(),
    '/classExample':(context)=>ClassExample(),
  };
}










