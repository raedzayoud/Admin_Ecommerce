import 'package:admin_ecommerce/controller/order/acceptedorder_controller.dart';
import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/data/model/ordermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Cartorderaccepted extends GetView<AcceptedorderController> {
  final orderModel ordermodel;
  const Cartorderaccepted({super.key, required this.ordermodel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 5),
        color: AppColor.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Order Number : ${ordermodel.ordersId} ",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaycolor),
                    )),
                Spacer(),
                Text(
                  Jiffy.parse('${ordermodel.ordersDatetime}').fromNow(),
                  style: TextStyle(
                      color: AppColor.secondcolor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(),
            Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Order Price : ${ordermodel.ordersPrice}\$ ",
                  style: TextStyle(fontSize: 15),
                )),
            Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Delivery Price : ${ordermodel.ordersPricedelivery}\$ ",
                  style: TextStyle(fontSize: 15),
                )),
            Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Payement Method : ${controller.getpayementmethod(ordermodel.ordersPaymentmethod.toString())}  ",
                  style: TextStyle(fontSize: 15),
                )),
            Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Order Status : ${controller.getOrderStatus(ordermodel.ordersStatus.toString())}  ",
                  style: TextStyle(fontSize: 15),
                )),
            Divider(),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Total Price : ${ordermodel.orderTotalprice}\$ ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaycolor),
                    )),
                Spacer(),
                if (ordermodel.ordersStatus == 1)
                  Container(
                    width: 90,
                    child: MaterialButton(
                      onPressed: ()async {
                       await controller.getDone(
                            "${ordermodel.ordersId}",
                            "${ordermodel.ordersUserid}",
                            "${ordermodel.ordersType}");
                        controller.getDataAccepted();
                      },
                      child: Text("Done",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaycolor)),
                    ),
                  ),
                Container(
                  width: 85,
                  child: MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.ordersdetails,
                          arguments: {"orderdetails": ordermodel});
                    },
                    child: Text("Details",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaycolor)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
