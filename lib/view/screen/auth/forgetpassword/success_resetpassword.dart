import 'package:admin_ecommerce/controller/forgetpassword/successresetpassword_controller.dart';
import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetpassword extends StatelessWidget {
  const SuccessResetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessresetpasswordControllerImp controllerImp=Get.put(SuccessresetpasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0.0,
        title: Text(
          "Success",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
                child: Icon(
              Icons.check_circle_outline,
              color: AppColor.primaycolor,
              size: 200,
            )),
            SizedBox(
              height: 10,
            ),
            Text(
              "Your account has been successfully created!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Custombuttonauth(
                content: "Go To Login",
                onPressed: () {
                 controllerImp.goToLogin();
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
