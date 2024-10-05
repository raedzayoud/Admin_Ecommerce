import 'package:admin_ecommerce/core/class/statusrequest.dart';
import 'package:admin_ecommerce/core/function/handlingdata.dart';
import 'package:admin_ecommerce/core/services/services.dart';
import 'package:admin_ecommerce/data/datasource/remote/categories_data.dart';
import 'package:admin_ecommerce/data/model/categoriesmodel.dart';
import 'package:admin_ecommerce/data/model/catmodel.dart';
import 'package:get/get.dart';

class CategoriesViewController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  CategoriesData approveData = CategoriesData(Get.find());
  List<CategoriesModel> datacat = [];

  getDataCategories() async {
    datacat.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await approveData.getDataCategories();
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        datacat.addAll(data.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  @override
  void onInit() {
    getDataCategories();
    super.onInit();
  }
}