import 'package:admin_ecommerce/controller/categories/add_controller.dart';
import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/core/constant/imageassets.dart';
import 'package:admin_ecommerce/core/function/validinput.dart';
import 'package:admin_ecommerce/view/widget/auth/curstomtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesAdd extends StatelessWidget {
  const CategoriesAdd({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesViewController controller = Get.put(CategoriesViewController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Categories"),
      ),
      body: Container(
        child: ListView(
          children: [
            Image.asset(AppImageassets.categorie,height: 300,),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Curstomtextformauth(
                  hintText: "Categories Name",
                  label: "Categories Name",
                  iconData: Icons.category,
                  mycontroller: controller.name,
                  validator: (val) {
                    return validinput(val!, 1, 20, "");
                  }),
            ),
            SizedBox(height: 15,),
            Container(
              decoration: BoxDecoration(
                  color: AppColor.red,
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  "Please choose image",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.white),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.primaycolor,
              ),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  "Upload",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
