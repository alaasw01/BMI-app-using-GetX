import 'package:get/get.dart';

import '../controller/bmi_controller.dart';

class BmiBindings extends Bindings{
    
      @override
      void dependencies() {
     Get.put(BmiController());
      }

}