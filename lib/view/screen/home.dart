import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/core/constant/imageassets.dart';
import 'package:admin_ecommerce/view/widget/home/cardhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
              Cardhome(title: "Message",url: AppImageassets.message,onTap: (){},),
              Cardhome(title: "Product",url: AppImageassets.product,onTap: (){},),
             
           
            ],)
          ],
        ),
      ),
    );
  }
}