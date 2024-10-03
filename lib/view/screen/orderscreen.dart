import 'package:admin_ecommerce/controller/orderscreen_controller.dart';
import 'package:admin_ecommerce/view/widget/home/curstombuttomapparhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orderscreen extends StatelessWidget {
  const Orderscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderscreenController());
    return GetBuilder<OrderscreenController>(
        builder: (controller) => Scaffold(
              bottomNavigationBar: Curstombuttomapparhome(),
              body: controller.list.elementAt(controller.currentindex),
            ));
  }
}