import 'package:admin_ecommerce/controller/orderdetails_controller.dart';
import 'package:admin_ecommerce/core/class/handlingdataview.dart';
import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class Orderdetails extends StatelessWidget {
  const Orderdetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrderdetailsController controller = Get.put(OrderdetailsController());
    return Scaffold(
        appBar: AppBar(
          title: Text("OrderDetails"),
        ),
        body: GetBuilder<OrderdetailsController>(
            builder: (controller) => Handlingdataview(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    child: ListView(
                      children: [
                        Lottie.asset(AppImageassets.information,
                            width: 300, height: 200),
                        Container(
                          //height: 150,
                          child: Card(
                            color: AppColor.white,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Table(
                                  children: [
                                    TableRow(children: [
                                      SizedBox(height: 10),
                                      SizedBox(height: 10),
                                      SizedBox(height: 10),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "Item",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppColor.secondcolor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                      Text(
                                        "Quantity",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppColor.secondcolor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                      Text(
                                        "Price",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppColor.secondcolor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      SizedBox(height: 10),
                                      SizedBox(height: 10),
                                      SizedBox(height: 10),
                                    ]),
                                    ...List.generate(
                                        controller.dataorders.length, (index) {
                                      int price = controller
                                          .dataorders[index].itemsPrice!;
                                      int discount = controller
                                          .dataorders[index].itemsDiscount!;
                                      return TableRow(children: [
                                        Text(
                                          " ${controller.dataorders[index].itemsName}",
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "${controller.dataorders[index].nbreoccurence}",
                                          textAlign: TextAlign.center,
                                        ),
                                        // Text(
                                        //   "${discount==0?price:price-(price*discount)/100}",
                                        //   textAlign: TextAlign.center,
                                        // ),
                                        Text(
                                          "${controller.dataorders[index].cartPrice}",
                                          textAlign: TextAlign.center,
                                        ),
                                      ]);
                                    }),
                                    TableRow(children: [
                                      SizedBox(height: 25),
                                      SizedBox(height: 25),
                                      SizedBox(height: 25),
                                    ]),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Total Price : ${controller.ordermodel!.orderTotalprice} \$",
                                    style: TextStyle(
                                        color: AppColor.secondcolor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        controller.ordermodel!.addressStreet != null
                            ? Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: Card(
                                  color: AppColor.white,
                                  child: ListTile(
                                    title: Text(
                                      "Shipping Address",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.secondcolor),
                                    ),
                                    subtitle: Text(
                                        " ${controller.ordermodel!.addressStreet}${controller.ordermodel!.addressCity}"),
                                  ),
                                ),
                              )
                            : Text(""),
                      ],
                    ),
                  ),
                )));
  }
}
