import 'package:admin_ecommerce/controller/categories/view_controller.dart';
import 'package:admin_ecommerce/core/class/handlingdataview.dart';
import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesViewController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.white,
        onPressed: () {
          Get.toNamed(AppRoutes.categorieadd);
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<CategoriesViewController>(
        builder: (controller) => HandlingdataRequest(
          statusRequest: controller.statusRequest,
          widget: WillPopScope(
            onWillPop: () {
              return controller.GoBackHome();
            },
            child: Container(
              child: ListView.builder(
                itemCount: controller.datacat.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: AppColor.white,
                    child: Row(
                      children: [
                        Expanded(
                            child: Image.network(
                          "${AppLinkApi.imagesCategories}/${controller.datacat[index].categoriesImage}",
                          height: 90,
                        )),
                        Expanded(
                          child: ListTile(
                            trailing: IconButton(
                              icon: Icon(Icons.delete_forever_outlined),
                              onPressed: () {
                                Get.defaultDialog(
                                    title: "Warning",
                                    titleStyle: TextStyle(color: AppColor.red),
                                    content:
                                        Text("Are you sure to delete it !"),
                                    onCancel: () {},
                                    onConfirm: () {
                                      controller.deleteCategories(
                                          controller.datacat[index].categoriesId
                                              .toString(),
                                          controller
                                              .datacat[index].categoriesImage
                                              .toString());
                                      Get.back();
                                      controller.getDataCategories();
                                    });
                              },
                            ),
                            title: Text(
                              "${controller.datacat[index].categoriesName}",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                                "${controller.datacat[index].categoriesDatatime}",
                                style: TextStyle(fontSize: 14)),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
