import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/view/screen/order/accepted.dart';
import 'package:admin_ecommerce/view/screen/order/archive.dart';
import 'package:admin_ecommerce/view/screen/order/orders.dart';
import 'package:admin_ecommerce/view/screen/setting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admin_ecommerce/core/class/statusrequest.dart';
import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/core/function/handlingdata.dart';
import 'package:admin_ecommerce/core/services/services.dart';
import 'package:admin_ecommerce/data/datasource/remote/auth/login_data.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderscreenController extends GetxController {
  int currentindex=0;
  Map<String, IconData> mp = {
    "Pending": Icons.pending,
    "Accepted": Icons.shopping_bag_outlined,
    "Archive": Icons.archive_outlined,
  };

  List list = [
    Orders(),
    Accepted(),
    Archive(),
  ];

  changeColor(currentindex, i){
    return currentindex==i?AppColor.primaycolor:AppColor.black;
  }

  changePage(i){
    currentindex=i;
    update();
  }

  


}
