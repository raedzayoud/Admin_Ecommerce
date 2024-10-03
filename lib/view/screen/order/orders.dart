import 'package:admin_ecommerce/controller/orders_controller.dart';
import 'package:admin_ecommerce/core/class/handlingdataview.dart';
import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/view/widget/order/cardorder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Orders"),
          centerTitle: true,
        ),
        body: Container(
            color: AppColor.white,
            child: GetBuilder<OrdersController>(
                builder: (conttoller) => Handlingdataview(
                      statusRequest: conttoller.statusRequest,
                      widget: Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          color: AppColor.white,
                          child: ListView.builder(
                              itemCount: conttoller.dataorders.length,
                              itemBuilder: (context, index) {
                                return CardOrder(
                                    ordermodel: conttoller.dataorders[index]);
                              })),
                    ))));
  }
}