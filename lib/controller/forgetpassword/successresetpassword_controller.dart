import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SuccessresetpasswordController extends GetxController {
  goToLogin();
}

class SuccessresetpasswordControllerImp extends SuccessresetpasswordController {
  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
  }
  
  
}
