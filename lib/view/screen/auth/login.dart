import 'package:admin_ecommerce/controller/auth/login_controlller.dart';
import 'package:admin_ecommerce/core/class/handlingdataview.dart';
import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/core/function/alertexitapp.dart';
import 'package:admin_ecommerce/core/function/validinput.dart';
import 'package:admin_ecommerce/view/widget/auth/curstomtextformauth.dart';
import 'package:admin_ecommerce/view/widget/auth/custombuttonauth.dart';
import 'package:admin_ecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:admin_ecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:admin_ecommerce/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControlllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.white,
          elevation: 0.0,
          title: Text(
            "Sign in ",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: WillPopScope(
          onWillPop: () => alertExitApp(),
          child: GetBuilder<LoginControlllerImp>(
              builder: (controlllerImp) => HandlingdataRequest(
                    statusRequest: controlllerImp.statusRequest,
                    widget: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        color: Colors.white,
                        padding: EdgeInsets.all(20),
                        child: Form(
                          key: controlllerImp.formstate,
                          child: ListView(
                            children: [
                              Logoauth(),
                              Customtexttitleauth(
                                title: "Welcome Back",
                              ),
                              Customtextbodyauth(
                                body:
                                    "Sign in with your email and password Or continue with your social media",
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
                              GetBuilder<LoginControlllerImp>(
                                builder: (controlllerImp) =>
                                    Curstomtextformauth(
                                  obscturetext: controlllerImp.isshowpassword,
                                  hintText: "Enter Your Password",
                                  iconData: Icons.lock_outline,
                                  label: "Password",
                                  mycontroller: controlllerImp.password,
                                  validator: (val) {
                                    return validinput(val!, 4, 100, "password");
                                  },
                                  onTapIcon: () {
                                    controlllerImp.showpassword();
                                  },
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controlllerImp.goToForgetPassword();
                                },
                                child: Text(
                                  "Forget Password ?",
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              Custombuttonauth(
                                content: "Sign In",
                                onPressed: () {
                                  controlllerImp.Login();
                                },
                              ),
                              SizedBox(
                                height: 13,
                              ),
                            ],
                          ),
                        )),
                  )),
        ));
  }
}
