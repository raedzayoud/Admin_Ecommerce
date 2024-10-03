import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mymiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices services=Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if(services.sharedPreferences.getString("step")=="2"){
      return RouteSettings(name: AppRoutes.home);
    }
    if(services.sharedPreferences.getString("step")=="1"){
      return RouteSettings(name: AppRoutes.login);
    }
  }
}
