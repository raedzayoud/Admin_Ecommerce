import 'dart:io';

import 'package:admin_ecommerce/core/class/statusrequest.dart';
import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/core/function/handlingdata.dart';
import 'package:admin_ecommerce/core/services/services.dart';
import 'package:admin_ecommerce/data/datasource/remote/categories_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesViewController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  CategoriesData approveData = CategoriesData(Get.find());
  File? file;
  TextEditingController name = TextEditingController();

  addDataCategories() async {
    //  datacat.clear();
    statusRequest = StatusRequest.loading;
    update();
    Map<String, String> data = {"name": name.text};
    var response = await approveData.addCategories(data, file!);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoutes.categorieview);
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
