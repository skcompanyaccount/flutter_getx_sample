import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_core/ui/ui.dart';

class ClassExample extends Ui{
  final ClassController controller=ClassController();
  @override
  Widget build(BuildContext context)=>getPage(
      title: 'Class GetX Example',
      body: Container(
        child: GetX<ClassController>(
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

class X{
  final strings=<String>[
    "Görüntülenmesi Gereken Sayfayı",
    "Görüntülüyorsunuz",
    "..."
  ];
  final isLoading=false.obs;
  final isErrorExist=false.obs;
}


class ClassController extends GetxController{
  static ClassController get to =>Get.find<ClassController>();

  final classX=X().obs;

  List<String> get strings=>classX.value.strings;
  bool get isLoading=>classX.value.isLoading.value;
  bool get isErrorExist=>classX.value.isErrorExist.value;

  void onLoaded(){
    classX.value.isLoading.value=false;
    classX.value.isErrorExist.value=false;
    update();
  }

  void onLoading(){
    classX.value.isLoading.value=true;
    classX.value.isErrorExist.value=false;
    update();
  }
  void onError(){
    classX.value.isLoading.value=false;
    classX.value.isErrorExist.value=true;
    update();
  }

  @override
  void onInit() async{
    classX.value.isLoading.value=true;
    update();
    super.onInit();
  }
}

