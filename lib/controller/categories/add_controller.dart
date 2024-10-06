import 'dart:io';

import 'package:admin_ecommerce/controller/categories/view_controller.dart';
import 'package:admin_ecommerce/core/class/statusrequest.dart';
import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/core/function/handlingdata.dart';
import 'package:admin_ecommerce/core/function/uploadfile.dart';
import 'package:admin_ecommerce/core/services/services.dart';
import 'package:admin_ecommerce/data/datasource/remote/categories_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesAddController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  CategoriesData approveData = CategoriesData(Get.find());
  File? file;
  TextEditingController name = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();

  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }
  addDataCategories() async {
    //  datacat.clear();
    if (formState.currentState!.validate()) {
      if (file == null) {
        return Get.defaultDialog(title: "Warning",content: Text("Please choose image"));
      }
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
            Get.snackbar(
          "Information", // Title
          "The Categorie was added successfully", // Message
          snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
          backgroundColor: AppColor.black, // Background color
          colorText: Colors.white, // Text color
          icon: Icon(Icons.check_circle, color: Colors.white), // Optional icon
          duration: Duration(seconds: 3), // Display duration
          margin: EdgeInsets.all(10),); // Margin around the snackbar
          // CategoriesViewController categoriesViewController=Get.find();
          // categoriesViewController.getDataCategories();
          Get.offAllNamed(AppRoutes.home);

        } else {
          statusRequest = StatusRequest.failed;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
