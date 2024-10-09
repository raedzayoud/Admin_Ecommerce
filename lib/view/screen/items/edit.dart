import 'package:admin_ecommerce/controller/categories/add_controller.dart';
import 'package:admin_ecommerce/controller/categories/edit_controller.dart';
import 'package:admin_ecommerce/controller/items/edit_controller.dart';
import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/core/constant/imageassets.dart';
import 'package:admin_ecommerce/core/function/uploadfile.dart';
import 'package:admin_ecommerce/core/function/validinput.dart';
import 'package:admin_ecommerce/core/shared/customdropdownlist.dart';
import 'package:admin_ecommerce/view/widget/auth/curstomtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsEdit extends StatelessWidget {
  const ItemsEdit({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsEditController controller = Get.put(ItemsEditController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Items"),
        ),
        body: GetBuilder<ItemsEditController>(
          builder: (controller) => Container(
            child: ListView(
              children: [
                Image.asset(
                  AppImageassets.product,
                  height: 300,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Curstomtextformauth(
                      hintText: "Items Name",
                      label: "Items Name",
                      iconData: Icons.category,
                      mycontroller: controller.name,
                      validator: (val) {
                        return validinput(val!, 1, 50, "");
                      }),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Curstomtextformauth(
                      hintText: "Give desc of the item ",
                      label: "Desc",
                      iconData: Icons.category,
                      mycontroller: controller.desc,
                      validator: (val) {
                        return validinput(val!, 1, 200, "");
                      }),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Curstomtextformauth(
                      hintText: "Count item",
                      label: "Count",
                      iconData: Icons.category,
                      mycontroller: controller.count,
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
                      mycontroller: controller.discount,
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
                      mycontroller: controller.price,
                      validator: (val) {
                        return validinput(val!, 1, 20, "");
                      }),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Curstomtextformauth(
                      hintText: "${controller.drop_down_list_name.text}",
                      label: "Categories",
                      iconData: Icons.category,
                      mycontroller: controller.drop_down_list_name,
                      validator: (val) {
                        return validinput(val!, 1, 20, "");
                      }),
                ),

                RadioListTile(
                    title: Text("Hide"),
                    value: "0",
                    groupValue: controller.isActive,
                    onChanged: (val) {
                      controller.changeactive(val);
                    }),

                RadioListTile(
                    title: Text("Active"),
                    value: "1",
                    groupValue: controller.isActive,
                    onChanged: (val) {
                      controller.changeactive(val);
                    }),

                SizedBox(
                  height: 15,
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
                      controller.editItems();

                      //controller.categoriesModel = null;
                    },
                    child: Text(
                      "Save",
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
        ));
  }
}
