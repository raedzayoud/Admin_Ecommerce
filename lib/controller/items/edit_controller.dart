import 'dart:io';
import 'package:admin_ecommerce/controller/categories/view_controller.dart';
import 'package:admin_ecommerce/controller/items/view_controller.dart';
import 'package:admin_ecommerce/core/class/statusrequest.dart';
import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/core/function/handlingdata.dart';
import 'package:admin_ecommerce/core/function/uploadfile.dart';
import 'package:admin_ecommerce/core/services/services.dart';
import 'package:admin_ecommerce/data/datasource/remote/categories_data.dart';
import 'package:admin_ecommerce/data/datasource/remote/items_data.dart';
import 'package:admin_ecommerce/data/model/categoriesmodel.dart';
import 'package:admin_ecommerce/data/model/itemsmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsEditController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  ItemsData approveData = ItemsData(Get.find());
  File? file;
  late TextEditingController name;
  late TextEditingController desc;
  late TextEditingController count;
  late TextEditingController discount;
  late TextEditingController price;
  late TextEditingController drop_down_list_name;
  late TextEditingController drop_down_list_id;
  List<SelectedListItem> dataselected = [];
  ItemsModel? itemsModel;

  String isActive = "0";

  changeactive(val) {
    isActive = val;
    update();
  }

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
      "id": itemsModel!.itemsId!.toString(),
      "name": name.text,
      "items_desc": desc.text,
      "items_count": count.text,
      "items_active": isActive,
      "items_price": price.text,
      "items_categories": drop_down_list_id.text,
      "items_discount": discount.text,
      "imageold": itemsModel!.itemsImage!,
      
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

    itemsModel = Get.arguments['itemsModel'];

    // Check if itemsModel is not null
    if (itemsModel != null) {
      name = TextEditingController(text: itemsModel!.itemsName ?? '');
      desc = TextEditingController(text: itemsModel!.itemsDesc ?? '');
      count = TextEditingController(
          text: itemsModel!.itemsCount?.toString() ?? '0');
      discount = TextEditingController(
          text: itemsModel!.itemsDiscounts?.toString() ?? '0');
      price = TextEditingController(
          text: itemsModel!.itemsPrice?.toString() ?? '0');
      drop_down_list_name =
          TextEditingController(text: itemsModel!.categoriesName ?? '');
      drop_down_list_id = TextEditingController(
          text: itemsModel!.categoriesId?.toString() ?? '');
      isActive = itemsModel!.itemsActive.toString();
    } else {
      // Handle case where itemsModel is null
      name = TextEditingController();
      desc = TextEditingController();
      count = TextEditingController();
      discount = TextEditingController();
      price = TextEditingController();
      drop_down_list_name = TextEditingController();
      drop_down_list_id = TextEditingController();
    }
  }
}
