import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/core/constant/imageassets.dart';
import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/view/widget/home/cardhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        color: AppColor.white,
        child: ListView(
          children: [
            SizedBox(height: 20,),
            GridView(
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisExtent: 140) ,
            shrinkWrap: true,
           children: [
          
              Cardhome(title: "Notifications",url: AppImageassets.notifications,onTap: (){},),
              Cardhome(title: "Users",url: AppImageassets.man,onTap: (){},),
              Cardhome(title: "Items",url: AppImageassets.product,onTap: (){},),
              Cardhome(title: "Categories",url: AppImageassets.categorie,onTap: (){
                Get.toNamed(AppRoutes.categorieview);
              },),
              Cardhome(title: "Report",url: AppImageassets.report,onTap: (){},),
              Cardhome(title: "Orders",url: AppImageassets.order,onTap: (){},),
             
           
            ],)
          ],
        ),
      ),
    );
  }
}