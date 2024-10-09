import 'dart:io';
import 'package:admin_ecommerce/data/model/categoriesmodel.dart';
import 'package:admin_ecommerce/controller/items/view_controller.dart';
import 'package:admin_ecommerce/core/class/statusrequest.dart';
import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/core/function/handlingdata.dart';
import 'package:admin_ecommerce/core/function/uploadfile.dart';
import 'package:admin_ecommerce/core/services/services.dart';
import 'package:admin_ecommerce/data/datasource/remote/categories_data.dart';
import 'package:admin_ecommerce/data/datasource/remote/items_data.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsAddController extends GetxController {
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
  GlobalKey<FormState> formState = GlobalKey();
  List<SelectedListItem> dataselected = [];

  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  addDataItems() async {
    // Validate form state
    if (formState.currentState!.validate()) {
      // Check if an image has been selected
      if (file == null) {
        return Get.defaultDialog(
          title: "Warning",
          content: Text("Please choose an image"),
        );
      }
      if (drop_down_list_name.text == "") {
        return Get.defaultDialog(
          title: "Warning",
          content: Text("Please choose categories"),
        );
      }

      // Show loading state
      statusRequest = StatusRequest.loading;
      update();

      // Prepare data for the request
      Map<String, String> data = {
        "items_name": name.text,
        "items_desc": desc.text,
        "items_count": count.text,
        "items_active": "1",
        "items_price": price.text,
        "items_categories": drop_down_list_id.text,
        "items_discount": discount.text,
      };

      // Make the request to add category with the uploaded image
      var response = await approveData.addItems(data, file!);

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
            "The items was added successfully",
            snackPosition: SnackPosition.TOP,
            backgroundColor: AppColor.black,
            colorText: Colors.white,
            icon: Icon(Icons.check_circle, color: Colors.white),
            duration: Duration(seconds: 3),
            margin: EdgeInsets.all(10),
          );

          // Refresh the categories list by calling the getDataCategories method
          ItemsViewController itemsViewController = Get.find();
          itemsViewController.getDataItems();
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

  getDataItemsCategories() async {
    CategoriesData categoriesData = CategoriesData(Get.find());
    List<CategoriesModel> datacat = [];
    datacat.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.getDataCategories();
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        datacat.addAll(data.map((e) => CategoriesModel.fromJson(e)));
        for (int i = 0; i < datacat.length; i++) {
          dataselected.add(SelectedListItem(
              name: datacat[i].categoriesName!,
              value: datacat[i].categoriesId.toString()));
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  @override
  void onInit() {
    getDataItemsCategories();
    name = TextEditingController();
    desc = TextEditingController();
    count = TextEditingController();
    discount = TextEditingController();
    price = TextEditingController();
    drop_down_list_name = TextEditingController();
    drop_down_list_id = TextEditingController();
    super.onInit();
  }
}
