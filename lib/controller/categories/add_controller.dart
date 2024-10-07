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
  // Validate form state
  if (formState.currentState!.validate()) {
    // Check if an image has been selected
    if (file == null) {
      return Get.defaultDialog(
        title: "Warning",
        content: Text("Please choose an image"),
      );
    }

    // Show loading state
    statusRequest = StatusRequest.loading;
    update();

    // Prepare data for the request
    Map<String, String> data = {
      "name": name.text,
    };

    // Make the request to add category with the uploaded image
    var response = await approveData.addCategories(data, file!);

    // Check if response is null
    if (response == null) {
      statusRequest = StatusRequest.failed;
      update();
      return;
    }

    // Handle response status
    statusRequest = HandleData(response);

    // If the request was successful
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        // Show a success message using Get.snackbar
        Get.snackbar(
          "Information", 
          "The Categorie was added successfully",
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColor.black,
          colorText: Colors.white,
          icon: Icon(Icons.check_circle, color: Colors.white),
          duration: Duration(seconds: 3),
          margin: EdgeInsets.all(10),
        );

        // Refresh the categories list by calling the getDataCategories method
        CategoriesViewController categoriesViewController = Get.find();
        categoriesViewController.getDataCategories();
        Get.offAllNamed(AppRoutes.home);
        // Navigate back to the previous screen
       // Get.back();
      } else {
        // If adding the category failed
        statusRequest = StatusRequest.failed;
      }
    } else {
      // If the request was not successful
      statusRequest = StatusRequest.failed;
    }

    // Update the UI to reflect the current state
    update();
  }
}


  @override
  void onInit() {
    super.onInit();
  }
}
