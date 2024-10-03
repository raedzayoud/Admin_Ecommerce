import 'package:admin_ecommerce/core/class/statusrequest.dart';
import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/core/function/handlingdata.dart';
import 'package:admin_ecommerce/core/services/services.dart';
import 'package:admin_ecommerce/data/datasource/remote/auth/login_data.dart';
import 'package:admin_ecommerce/data/model/catmodel.dart';
import 'package:admin_ecommerce/data/model/ordermodel.dart';
import 'package:get/get.dart';

class OrderdetailsController extends GetxController{

  StatusRequest statusRequest = StatusRequest.none;
 //  OrderpendingData ordersData = OrderpendingData(Get.find());
  MyServices myServices = Get.find();
  List<Catmodel> dataorders = [];

  orderModel ?ordermodel;

  // @override
  // void onInit() {
  //   ordermodel=Get.arguments['orderdetails'];
  //   getOrders();
  //   super.onInit();
  // }

  //   getOrders() async {
  //   dataorders.clear();
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response =
  //       await ordersData.getDataDetails(ordermodel!.ordersId.toString());
  //   if (response == null) {
  //     statusRequest = StatusRequest.failed;
  //   }
  //   statusRequest = HandleData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       List data = response['data'];
  //       dataorders.addAll(data.map((e) => Catmodel.fromJson(e)));
  //     } else {
  //       // Get.defaultDialog(
  //       //   title: "Warning", middleText: "Email or Phone aleardy exists");
  //       statusRequest = StatusRequest.failed;
  //     }
  //   }
  //   update();
  // }





}