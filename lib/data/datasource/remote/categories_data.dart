import 'dart:io';

import 'package:admin_ecommerce/core/class/crud.dart';
import 'package:admin_ecommerce/linkapi.dart';

class CategoriesData {
  Crud crud;

  CategoriesData(this.crud);

  getDataCategories() async {
    var response = await crud.postData(AppLinkApi.categoriesview, {});

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

  addCategories(Map<String, String> data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLinkApi.categoriesadd, data, file);

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

  deleteCategories(Map<String, String> data) async {
    var response = await crud.postData(AppLinkApi.categoriesdelete, data);

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

  editCategories(Map<String, String> data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLinkApi.categoriesedit, data);
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
