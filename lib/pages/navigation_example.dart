import 'package:flutter/material.dart';
import '../app_core/ui/ui.dart';
import 'package:get/get.dart';

class NavigationExample extends Ui{
  @override
  Widget build(BuildContext context)=>getPage(
    title: "GetX Navigation Example",
    body: getPageElementsWidget(
        pageElements: pageElements
    ),
  );

  List<Widget> get pageElements=>[
    SizedBox(height: 40.0),
    getSubTitle(title: "Açıklama"),
    SizedBox(height: 20.0),
    Container(
      child: Text("Aşağıdaki Butonlar Sayesinde\nSayfalar Arasında Geçiş\nYapabilirsiniz", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
      alignment: Alignment.center,
      width: double.infinity,
    ),
    SizedBox(height: 30.0),
    getSubTitle(title: "Sayfalar"),
    SizedBox(height: 10.0),
    getPageChangerButton(
        pageName: "GetX Basic Example",
        pageRouteName: "/basicExample",
        onPressed: ()=>Get.toNamed("/basicExample")
    ),
    getPageChangerButton(
        pageName: "GetX Class Example",
        pageRouteName: "/classExample",
        onPressed: ()=>Get.toNamed("/classExample")
    ),
  ];

}
