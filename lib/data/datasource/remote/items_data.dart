import 'dart:io';

import 'package:admin_ecommerce/core/class/crud.dart';
import 'package:admin_ecommerce/linkapi.dart';

class ItemsData {
  Crud crud;

  ItemsData(this.crud);

  getDataItems() async {
    var response = await crud.postData(AppLinkApi.itemsview, {});

    // Return the data based on whether the response is a success or failure
    return response.fold(
      (left) {
        // Handle the error (left side)
        return left; // Return null or some error object if you need to handle it differently
      },
      (right) {
        // Handle the success (right side)
        return right; // Return the successful response
      },
    );
  }

  addItems(Map<String, String> data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLinkApi.itemsadd, data, file);

    // Return the data based on whether the response is a success or failure
    return response.fold(
      (left) {
        // Handle the error (left side)
        return left; // Return null or some error object if you need to handle it differently
      },
      (right) {
        // Handle the success (right side)
        return right; // Return the successful response
      },
    );
  }

  deleteItems(Map<String, String> data) async {
    var response = await crud.postData(AppLinkApi.itemsdelete, data);

    // Return the data based on whether the response is a success or failure
    return response.fold(
      (left) {
        // Handle the error (left side)
        return left; // Return null or some error object if you need to handle it differently
      },
      (right) {
        // Handle the success (right side)
        return right; // Return the successful response
      },
    );
  }

  editItems(Map<String, String> data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLinkApi.itemsedit, data);
    } else {
      response = await crud.addRequestWithImageOne(
          AppLinkApi.categoriesedit, data, file);
    }

    // Return the data based on whether the response is a success or failure
    return response.fold(
      (left) {
        // Handle the error (left side)
        return left; // Return null or some error object if you need to handle it differently
      },
      (right) {
        // Handle the success (right side)
        return right; // Return the successful response
      },
    );
  }
}
