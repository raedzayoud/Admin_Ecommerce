import 'package:admin_ecommerce/controller/categories/view_controller.dart';
import 'package:admin_ecommerce/controller/items/view_controller.dart';
import 'package:admin_ecommerce/core/class/handlingdataview.dart';
import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsViewController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Items"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.white,
        onPressed: () {
          Get.toNamed(AppRoutes.itemsadd);
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<ItemsViewController>(
        builder: (controller) => HandlingdataRequest(
          statusRequest: controller.statusRequest,
          widget: WillPopScope(
            onWillPop: () {
              return controller.GoBackHome();
            },
            child: Container(
              child: ListView.builder(
                itemCount: controller.dataitems.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      controller.GoToPageEdit(controller.dataitems[index]); 
                    },
                    child: Card(
                      color: AppColor.white,
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    "${AppLinkApi.imagesItems}/${controller.dataitems[index].itemsImage}",
                                fit: BoxFit.fill,
                                height: 140,
                                width: 120,
                              ), 
                              
                            ],
                          )),
                        
                         Container(
                          width: 100,
                           child: Text(
                                    "${controller.dataitems[index].itemsName}",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),textAlign: TextAlign.center,
                                  ),
                         ),
                          
                          Expanded(
                            child: ListTile(
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.delete_forever_outlined),
                                    onPressed: () {
                                      Get.defaultDialog(
                                          title: "Warning",
                                          titleStyle:
                                              TextStyle(color: AppColor.red),
                                          content:
                                              Text("Are you sure to delete it !"),
                                          onCancel: () {},
                                          onConfirm: () async {
                                            await controller.deleteItems(
                                                controller
                                                    .dataitems[index].itemsId
                                                    .toString(),
                                                controller.dataitems[index]
                                                    .itemsImage
                                                    .toString());
                                           // Get.back();
                                            controller.getDataItems();
                                            Get.back();
                                          });
                                    },
                                  ),
                                  // IconButton(
                                  //   icon: Icon(Icons.edit),
                                  //   onPressed: () {
                                  //     Get.toNamed(AppRoutes.itemsedit,
                                  //         arguments: {
                                  //           "itemsModel":
                                  //               controller.dataitems[index]
                                  //         });
                                  //   },
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
