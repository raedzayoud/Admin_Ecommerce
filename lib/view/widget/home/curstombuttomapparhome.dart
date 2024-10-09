import 'package:admin_ecommerce/controller/order/orderscreen_controller.dart';
import 'package:admin_ecommerce/view/widget/home/custombuttomappar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Curstombuttomapparhome extends GetView<OrderscreenController> {
  const Curstombuttomapparhome({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
       child: SingleChildScrollView(
      
        child: Row(
          children: [
            ...List.generate(controller.list.length, (index) {
              int i = index;
              return Expanded(
                  child: Custombuttomappar(
                textappar: controller.mp.keys.elementAt(i),
                iconData: controller.mp[controller.mp.keys.elementAt(i)]!,
                color: controller.changeColor(controller.currentindex, i),
                onPressed: () {
                  controller.changePage(i);
                },
              ));
            }),
          ],
        ),
      ),
    );
  }
}
