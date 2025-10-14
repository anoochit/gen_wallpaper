import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GenerateController extends GetxController {
  String prompt = '';
  String template = '';
  TextEditingController promptTextController = TextEditingController();
  RxBool isSubmit = false.obs;
  RxBool showPopup = false.obs;

  @override
  void onInit() {
    prompt = Get.parameters['prompt'] ?? '';
    template = Get.parameters['template'] ?? '';
    showPopup.value = (Get.parameters['popup'] == 'y');
    promptTextController.text = prompt;
    super.onInit();
  }

  void genFromTextField() {
    prompt = promptTextController.text;
    isSubmit.value = true;
    update();
  }
}
