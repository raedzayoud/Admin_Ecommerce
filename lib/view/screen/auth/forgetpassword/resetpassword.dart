import 'package:admin_ecommerce/controller/forgetpassword/resetpassword_controller.dart';
import 'package:admin_ecommerce/core/class/handlingdataview.dart';
import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/core/function/validinput.dart';
import 'package:admin_ecommerce/view/widget/auth/curstomtextformauth.dart';
import 'package:admin_ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:admin_ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:admin_ecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetpasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0.0,
        title: Text(
          "Reset Password",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<ResetpasswordControllerImp>(
        builder: (controlllerImp) =>
        HandlingdataRequest(
                    statusRequest: controlllerImp.statusRequest,widget: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Form(
              key: controlllerImp.formState,
              child: ListView(
                children: [
                  Customtexttitleauth(
                    title: "New Password",
                  ),
                  Customtextbodyauth(
                    body: "Please Enter a new Password",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Curstomtextformauth(
                    validator: (val) {
                      return validinput(val!, 5, 100, "password");
                    },
                    hintText: "Enter Your Password",
                    iconData: Icons.lock_outline,
                    label: "Password",
                    mycontroller: controlllerImp.password,
                  ),
                  Curstomtextformauth(
                    hintText: "Repeat Enter Your Password",
                    iconData: Icons.lock_outline,
                    label: "Password",
                    mycontroller: controlllerImp.repassword,
                    validator: (val) {
                      return validinput(val!, 5, 100, "password");
                    },
                  ),
                  Custombuttonauth(
                    content: "Save",
                    onPressed: () {
                      controlllerImp.resetPassword();
                    },
                  ),
                ],
              ),
            )),),
         
      ),
    );
  }
}
