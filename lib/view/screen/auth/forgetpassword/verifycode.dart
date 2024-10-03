
import 'package:admin_ecommerce/controller/forgetpassword/verifycode_controller.dart';
import 'package:admin_ecommerce/core/class/handlingdataview.dart';
import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:admin_ecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class Verifycode extends StatelessWidget {
  const Verifycode({super.key});

  @override
  Widget build(BuildContext context) {
    
        Get.put(VerifycodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0.0,
        title: Text(
          "Verify Code",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<VerifycodeControllerImp>(builder: (controller) =>
      HandlingdataRequest(
                    statusRequest: controller.statusRequest,widget: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Customtexttitleauth(
                title: "Check Code",
              ),
              Customtextbodyauth(
                body: "Please Enter the Digit Code Sent To ${controller.email}",
              ),
              SizedBox(
                height: 10,
              ),
              OtpTextField(
                numberOfFields: 5,
                fieldWidth: 50,
                borderRadius: BorderRadius.circular(30),
                borderColor: Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  controller.checkCode(verificationCode);
                }, // end onSubmit
              ),
            ],
          )),)
       ),
    );
  }
}
