import 'package:admin_ecommerce/core/class/statusrequest.dart';
import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/core/function/handlingdata.dart';
import 'package:admin_ecommerce/core/services/services.dart';
import 'package:admin_ecommerce/data/datasource/remote/auth/login_data.dart';
import 'package:admin_ecommerce/data/datasource/remote/order/accepted_data.dart';
import 'package:admin_ecommerce/data/datasource/remote/order/archive_data.dart';
import 'package:admin_ecommerce/data/datasource/remote/order/prepare_data.dart';
import 'package:admin_ecommerce/data/model/ordermodel.dart';
import 'package:get/get.dart';

class AcceptedorderController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  AcceptedData ordersData = AcceptedData(Get.find());
  MyServices myServices = Get.find();
  PrepareData prepareData = PrepareData(Get.find());
  List<orderModel> dataorders = [];
  List<orderModel> dataaccepted = [];
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
      return "Await Approval";
    } else if (val == "1") {
      return "The order is being Prepared ";
    } else if (val == "2") {
      return "The order had picked by the delivery man ";
    } else if (val == "3") {
      return "On The Way ";
    } else {
      return "Archive";
    }
  }

  getOrdersPending() async {
    dataorders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getPending();
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        dataorders.addAll(data.map((e) => orderModel.fromJson(e)));
      } else {
        // Get.defaultDialog(
        //   title: "Warning", middleText: "Email or Phone aleardy exists");
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  getDataAccepted() async {
    dataaccepted.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getDataAccepted();
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        dataaccepted.addAll(data.map((e) => orderModel.fromJson(e)));
      } else {
        // Get.defaultDialog(
        //   title: "Warning", middleText: "Email or Phone aleardy exists");
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  getDone(String orderid, String usersid, String typeorder) async {
    dataorders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await prepareData.prepare(orderid, usersid, typeorder);
    if (response == null) {
      statusRequest = StatusRequest.failed;
    }
    statusRequest = HandleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        // List data = response['data'];
        // dataorders.addAll(data.map((e) => orderModel.fromJson(e)));
      } else {
        // Get.defaultDialog(
        //   title: "Warning", middleText: "Email or Phone aleardy exists");
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  @override
  void onInit() {
    //getOrdersPending();
   // getDataAccepted();
    super.onInit();
  }
}
