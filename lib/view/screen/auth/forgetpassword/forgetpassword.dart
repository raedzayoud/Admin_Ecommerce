
import 'package:admin_ecommerce/controller/forgetpassword/forgetpassword_controller.dart';
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

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetpasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0.0,
        title: Text(
          "Forget Password",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<ForgetpasswordControllerImp>(
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
                    title: "Check Email",
                  ),
                  Customtextbodyauth(
                    body:
                        "Please Enter Your Email Address To Recive A verification code",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Curstomtextformauth(
                    hintText: "Enter Your Email",
                    iconData: Icons.email_outlined,
                    label: "Email",
                    mycontroller: controlllerImp.email,
                    validator: (val) {
                      return validinput(val!, 5, 100, "email");
                    },
                  ),
                  Custombuttonauth(
                    content: "Check",
                    onPressed: () {
                      controlllerImp.Checkemail();
                    },
                  ),
                ],
              ),
            )),),
        
      ),
    );
  }
}
