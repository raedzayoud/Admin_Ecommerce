import 'package:admin_ecommerce/core/class/statusrequest.dart';
import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/core/function/handlingdata.dart';
import 'package:admin_ecommerce/core/services/services.dart';
import 'package:admin_ecommerce/data/datasource/remote/approve_data.dart';
import 'package:admin_ecommerce/data/datasource/remote/auth/login_data.dart';
import 'package:admin_ecommerce/data/model/ordermodel.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OrdersController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  //OrderpendingData ordersData = OrderpendingData(Get.find());
  MyServices myServices = Get.find();
  ApproveData approveData = ApproveData(Get.find());
  List<orderModel> dataorders = [];

  getordertype(val) {
    if (val == "0") {
      return "Delivery";
    } else if (val == "1") {
      return "Give Directy To Client ";
    }
  }

  getpayementmethod(val) {
    if (val == "0") {
      return "Cash on Delivery";
    } else if (val == "1") {
      return "Payement Card";
    }
  }

  getOrderStatus(val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is being Prepared ";
    } else if (val == "2") {
      return "Ready To Picked up by Delivery man";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  // getOrders() async {
  //   dataorders.clear();
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response =
  //       await ordersData.getData(myServices.sharedPreferences.getString("id")!);
  //   if (response == null) {
  //     statusRequest = StatusRequest.failed;
  //   }
  //   statusRequest = HandleData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       List data = response['data'];
  //       dataorders.addAll(data.map((e) => orderModel.fromJson(e)));
  //     } else {
  //       // Get.defaultDialog(
  //       //   title: "Warning", middleText: "Email or Phone aleardy exists");
  //       statusRequest = StatusRequest.failed;
  //     }
  //   }
  //   update();
  // }

  getOrdersapproved(String ordersid, String usersid) async {
    dataorders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await approveData.getDataApproved(
        ordersid, usersid, myServices.sharedPreferences.getString("id")!);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.defaultDialog(
          title: "Information", middleText: "You are take the delivery.Go to the client and give him his products");
      //  getOrders();
      } else {
        // Get.defaultDialog(
        //   title: "Warning", middleText: "Email or Phone aleardy exists");
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

}