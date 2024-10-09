import 'package:admin_ecommerce/core/class/statusrequest.dart';
import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/core/function/handlingdata.dart';
import 'package:admin_ecommerce/core/services/services.dart';
import 'package:admin_ecommerce/data/datasource/remote/categories_data.dart';
import 'package:admin_ecommerce/data/datasource/remote/items_data.dart';
import 'package:admin_ecommerce/data/model/categoriesmodel.dart';
import 'package:admin_ecommerce/data/model/catmodel.dart';
import 'package:admin_ecommerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

class ItemsViewController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  ItemsData categoriesData = ItemsData(Get.find());
  List<ItemsModel> dataitems = [];
  getDataItems() async {
    dataitems.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.getDataItems();
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        dataitems.addAll(data.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  @override
  void onInit() {
    getDataItems();
    super.onInit();
  }

  GoBackHome() {
    Get.offAllNamed(AppRoutes.home);
    return Future.value(true);
  }

  GoToPageEdit(ItemsModel itemsmodel) {
    Get.toNamed(AppRoutes.itemsedit, arguments: {"itemsModel": itemsmodel});
  }

  deleteItems(String id, String name) async {
    var response = await categoriesData.deleteItems({"id": id, "name": name});

    dataitems.removeWhere((elmemnt) => elmemnt.itemsId == id);

    update();
  }
}
