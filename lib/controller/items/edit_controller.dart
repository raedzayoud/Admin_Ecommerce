import 'dart:io';
import 'package:admin_ecommerce/controller/categories/view_controller.dart';
import 'package:admin_ecommerce/controller/items/view_controller.dart';
import 'package:admin_ecommerce/core/class/statusrequest.dart';
import 'package:admin_ecommerce/core/function/handlingdata.dart';
import 'package:admin_ecommerce/core/function/uploadfile.dart';
import 'package:admin_ecommerce/core/services/services.dart';
import 'package:admin_ecommerce/data/datasource/remote/categories_data.dart';
import 'package:admin_ecommerce/data/datasource/remote/items_data.dart';
import 'package:admin_ecommerce/data/model/categoriesmodel.dart';
import 'package:admin_ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsEditController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  ItemsData approveData = ItemsData(Get.find());
  File? file;
  TextEditingController? name;
  ItemsModel ?itemsModel; 

  // Choose image function
  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  // Edit category function
  editItems() async {
    statusRequest = StatusRequest.loading;
    update();

    Map<String, String> data = {
      "id": itemsModel!.categoriesId!.toString(),
      "name": name!.text,
      "imageold": itemsModel!.categoriesImage.toString()
    };
    var response = await approveData.editItems(data, file);
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        ItemsViewController categoriesViewController = Get.find();
        categoriesViewController.getDataItems();
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
    itemsModel = null;
    itemsModel = Get.arguments['itemsModel'];
    name = TextEditingController(text: itemsModel!.itemsName);
  }
}
