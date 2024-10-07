import 'package:admin_ecommerce/controller/categories/add_controller.dart';
import 'package:admin_ecommerce/controller/items/add_controller.dart';
import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/core/constant/imageassets.dart';
import 'package:admin_ecommerce/core/function/uploadfile.dart';
import 'package:admin_ecommerce/core/function/validinput.dart';
import 'package:admin_ecommerce/view/widget/auth/curstomtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsAdd extends StatelessWidget {
  const ItemsAdd({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsAddController controller = Get.put(ItemsAddController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Items"),
        ),
        body: GetBuilder<ItemsAddController>(
          builder: (controller) => Container(
            color: AppColor.white,
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  Image.asset(
                    AppImageassets.product,
                    height: 280,
                  ),
                  // SizedBox(
                  //   height: 40,
                  // ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Curstomtextformauth(
                        hintText: "Items Name",
                        label: "Items Name",
                        iconData: Icons.category,
                        mycontroller: controller.name,
                        validator: (val) {
                          return validinput(val!, 1, 20, "");
                        }),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Curstomtextformauth(
                        hintText: "Give desc of the item ",
                        label: "Desc",
                        iconData: Icons.category,
                        mycontroller: controller.name,
                        validator: (val) {
                          return validinput(val!, 1, 20, "");
                        }),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Curstomtextformauth(
                        hintText: "Count item",
                        label: "Count",
                        iconData: Icons.category,
                        mycontroller: controller.name,
                        validator: (val) {
                          return validinput(val!, 1, 20, "");
                        }),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Curstomtextformauth(
                        hintText: "Discount",
                        label: "Discount",
                        iconData: Icons.category,
                        mycontroller: controller.name,
                        validator: (val) {
                          return validinput(val!, 1, 20, "");
                        }),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Curstomtextformauth(
                        hintText: "Price",
                        label: "Price",
                        iconData: Icons.category,
                        mycontroller: controller.name,
                        validator: (val) {
                          return validinput(val!, 1, 20, "");
                        }),
                  ),

                  
                
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.red,
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      onPressed: () {
                        controller.chooseImage();
                      },
                      child: Text(
                        "Please choose image",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.white),
                      ),
                    ),
                  ),
                  // if (controller.file != null) Image.file(controller.file!),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.primaycolor,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: MaterialButton(
                      onPressed: () {
                        controller.addDataItems();
                      },
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
          ),
        ));
  }
}
