import 'package:admin_ecommerce/core/class/statusrequest.dart';
import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/core/function/handlingdata.dart';
import 'package:admin_ecommerce/core/services/services.dart';
import 'package:admin_ecommerce/data/datasource/remote/auth/login_data.dart';
import 'package:admin_ecommerce/data/datasource/remote/forgetpassword/verifycode_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifycodeController extends GetxController {
  checkCode(String verifycode);
}

class VerifycodeControllerImp extends VerifycodeController {
  String? email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest=StatusRequest.none;
  VerifycodeData verifycodeData = VerifycodeData(Get.find());
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  checkCode(String verifycode) async {
    if (email == null) {
      Get.defaultDialog(title: "Error", middleText: "Email is not provided");
      return;
    }
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifycodeData.postData(verifycode, email!);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoutes.resetpassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "The code is not correct ! ");
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }
}
