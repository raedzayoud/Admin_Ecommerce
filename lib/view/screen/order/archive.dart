import 'package:admin_ecommerce/controller/order/acceptedorder_controller.dart';
import 'package:admin_ecommerce/controller/order/archive_controller.dart';
import 'package:admin_ecommerce/core/class/handlingdataview.dart';
import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/view/widget/order/cardorderaccepted.dart';
import 'package:admin_ecommerce/view/widget/order/cardorderarchived.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Archive extends StatelessWidget {
  const Archive({super.key});

  @override
  Widget build(BuildContext context) {
   ArchiveController controller= Get.put(ArchiveController());
   controller.getOrdersArchive();
    return Scaffold(
        appBar: AppBar(
          title: Text("Archive Orders"),
          centerTitle: true,
        ),
        body: Container(
            color: AppColor.white,
            child: GetBuilder<ArchiveController>(
                builder: (conttoller) => Handlingdataview(
                      statusRequest: conttoller.statusRequest,
                      widget: Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          color: AppColor.white,
                          child: ListView.builder(
                              itemCount: conttoller.dataorders.length,
                              itemBuilder: (context, index) {
                                return Cardorderarchived(
                                    ordermodel: conttoller.dataorders[index]);
                              })),
                    ))));
  }
}