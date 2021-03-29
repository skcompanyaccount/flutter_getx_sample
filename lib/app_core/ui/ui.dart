import 'package:flutter/material.dart';

abstract class Ui extends StatelessWidget{
  const Ui({Key key}) : super(key: key);

  double screenWidth(BuildContext context)=>MediaQuery.of(context).size.width;
  double screenHeight(BuildContext context)=>MediaQuery.of(context).size.height;

  Scaffold getPage({Widget body, String title, Widget floatingActionButton})=>Scaffold(
    appBar: getAppBar(title: title),
    body: body,
    floatingActionButton: floatingActionButton,
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  );
  Widget getPageElementsWidget({List<Widget> pageElements})=>Container(
      child: ScrollConfiguration(
        child: SingleChildScrollView(
          child: Column(
            children: pageElements,
          ),
        ),
        behavior: ScrollBehavior(),
      ),
      width: double.infinity,
      height: double.infinity
  );

  Color get textColor=>Colors.blueGrey[700];
  TextStyle get appBarTitleTextStyle=>TextStyle(fontSize: 19.0, letterSpacing: 0.5, fontWeight: FontWeight.w500, color: textColor);
  AppBar getAppBar({String title})=>AppBar(
      title: Text(title, style: appBarTitleTextStyle,),
      centerTitle: true,
      backgroundColor: Colors.grey[200]
  );


  Widget getFloatingActionButtons({List<Widget> buttonList})=>Container(
    child: Row(
      children: buttonList,
      mainAxisAlignment: MainAxisAlignment.center,
    ),
    width: double.infinity,
    color: Colors.grey[200]
  );

  Widget getFloatingActionButton({String buttonText, Function onPressed})=>TextButton(
    child: Text(buttonText),
    onPressed: onPressed,
  );

  Widget getSubTitle({String title})=>Container(
    child: Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20), textAlign: TextAlign.center),
    width: double.infinity,
  );

  Widget getPageChangerButton({String pageRouteName, String pageName, Function onPressed})=>TextButton(
      child: Text(pageName, style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),),
      onPressed: onPressed
  );


  Widget get loadingState=>Container(
      child: CircularProgressIndicator(),
      width: 20.0,
      height: 20.0
  );

  Widget get errorState=>Container(
      child: Text("Hata Durumunda Görülmesi\nGereken Ekran", textAlign: TextAlign.center),
      width: double.infinity
  );

  Widget getNormalState({List<String> strings})=>Container(
    child: Text(strings[0]+"\n"+strings[1]+"\n"+strings[2], textAlign: TextAlign.center),
    width: double.infinity,
  );
}