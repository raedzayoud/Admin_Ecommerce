import 'dart:io';
import 'package:admin_ecommerce/controller/categories/view_controller.dart';
import 'package:admin_ecommerce/core/class/statusrequest.dart';
import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/core/function/handlingdata.dart';
import 'package:admin_ecommerce/core/function/uploadfile.dart';
import 'package:admin_ecommerce/core/services/services.dart';
import 'package:admin_ecommerce/data/datasource/remote/categories_data.dart';
import 'package:admin_ecommerce/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesEditController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  CategoriesData approveData = CategoriesData(Get.find());
  File? file;
  TextEditingController? name;
  CategoriesModel? categoriesModel;

  // Choose image function
  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  // Edit category function
  editCategories() async {
    statusRequest = StatusRequest.loading;
    update();

    Map<String, String> data = {
      "id": categoriesModel!.categoriesId!.toString(),
      "name": name!.text,
      "imageold": categoriesModel!.categoriesImage.toString()
    };
    var response = await approveData.editCategories(data, file);
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        CategoriesViewController categoriesViewController = Get.find();
        categoriesViewController.getDataCategories();
       // Get.toNamed(AppRoutes.categorieview);
        Get.back();
      } else {
        statusRequest = StatusRequest.failed;
      }
    } else {
      statusRequest = StatusRequest.failed;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    categoriesModel = null;
    categoriesModel = Get.arguments['categoriesModel'];
    name = TextEditingController(text: categoriesModel!.categoriesName);
  }
}
