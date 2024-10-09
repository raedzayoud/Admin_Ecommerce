import 'package:admin_ecommerce/core/constant/apptheme.dart';
import 'package:admin_ecommerce/core/services/services.dart';
import 'package:admin_ecommerce/routes.dart';
import 'package:admin_ecommerce/view/binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
 //   Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBinding(),
      getPages: getPages, // Ensure routes are correctly imported
      theme: themeData,
    );
  }
}
