import 'package:admin_ecommerce/controller/order/acceptedorder_controller.dart';
import 'package:admin_ecommerce/core/class/handlingdataview.dart';
import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/view/widget/order/cardorderaccepted.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Accepted extends StatelessWidget {
  const Accepted({super.key});

  @override
  Widget build(BuildContext context) {
  AcceptedorderController controller=  Get.put(AcceptedorderController());
  controller.getDataAccepted();
    return Scaffold(
        appBar: AppBar(
          title: Text("Accepted Orders"),
          centerTitle: true,
        ),
        body: Container(
            color: AppColor.white,
            child: GetBuilder<AcceptedorderController>(
                builder: (conttoller) => Handlingdataview(
                      statusRequest: conttoller.statusRequest,
                      widget: Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          color: AppColor.white,
                          child: ListView.builder(
                              itemCount: conttoller.dataaccepted.length,
                              itemBuilder: (context, index) {
                                return Cartorderaccepted(
                                    ordermodel: conttoller.dataaccepted[index]);
                              })),
                    ))));
  }
}