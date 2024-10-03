import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class CheckemailController extends GetxController {
  Checkemail();
  goToVerifycode();
}

class CheckemailControllerImp extends CheckemailController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  Checkemail() {
    if (formState.currentState!.validate()) {
       goToVerifycode();
    } else {}
  }

  @override
  goToVerifycode() {
    Get.offAllNamed(AppRoutes.verifycodesignup);
  }
}
