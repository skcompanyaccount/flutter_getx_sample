import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_core/ui/ui.dart';

class BasicExample extends Ui{
  final BasicController controller=BasicController();
  @override
  Widget build(BuildContext context)=>getPage(
      title: 'Class GetX Example',
      body: Container(
        child: GetX<BasicController>(
            init: this.controller,
            builder: (controller)=>controller.isLoading?loadingState:(
                controller.isErrorExist?errorState:getNormalState(strings: controller.strings)
            )
        ),
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    floatingActionButton: getFloatingActionButtons(
      buttonList: [
        getFloatingActionButton(buttonText: "Yüklenme", onPressed: ()=>controller.onLoading()),
        getFloatingActionButton(buttonText: "Hata", onPressed: ()=>controller.onError()),
        getFloatingActionButton(buttonText: "Durum", onPressed: ()=>controller.onLoaded()),
      ]
    )
  );
}


class BasicController extends GetxController{
  static BasicController get to =>Get.find<BasicController>();

  List<String> get strings=>_strings;
  bool get isLoading=>_isLoading.value;
  bool get isErrorExist=>_isErrorExist.value;

  final _strings=<String>[
    "Görüntülenmesi Gereken Sayfayı",
    "Görüntülüyorsunuz",
    "..."
  ];
  final _isLoading=false.obs;
  final _isErrorExist=false.obs;


  void onLoaded(){
    _isLoading.value=false;
    _isErrorExist.value=false;
    update();
  }

  void onLoading(){
    _isLoading.value=true;
    _isErrorExist.value=false;
    update();
  }
  void onError(){
    _isLoading.value=false;
    _isErrorExist.value=true;
    update();
  }

  @override
  void onInit() async{
    _isLoading.value=true;
    update();
    super.onInit();
  }
}