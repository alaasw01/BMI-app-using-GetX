import 'package:bmi/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BmiController extends GetxController {
  RxDouble height = 155.0.obs;
  RxInt age = 20.obs;
  RxInt weight = 60.obs;
  RxBool isMale = true.obs;
  RxString selectedLang='en'.obs;

  void changeGender(bool gender) {
    isMale.value = gender;
  }

  void incrementAge() {
    age.value++;
  }

  void decrementAge() {
    age.value--;
  }

  void incrementWeight() {
    weight.value++;
  }

  void decrementWeight() {
    weight.value--;
  }
  void changeLang(String langCode){
    selectedLang.value=langCode;
    Locale locale=Locale(langCode);
    sharedPrefrences!.setString('lang', langCode);
    Get.updateLocale(locale);
  }
  @override
  void onInit() {
    Locale initLang= sharedPrefrences!.getString('lang')==null?Get.deviceLocale!:Locale(sharedPrefrences!.getString('lang')!);
    Get.updateLocale(initLang);
    selectedLang.value = initLang.languageCode;
    super.onInit();
  }
}
