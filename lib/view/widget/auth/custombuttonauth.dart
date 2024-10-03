import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class Custombuttonauth extends StatelessWidget {
  final String content;
  final void Function()? onPressed;
  const Custombuttonauth({super.key, required this.content, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(10),
      onPressed: onPressed,
      color: AppColor.primaycolor,
      textColor: AppColor.white,
      child: Text(content,style: TextStyle(fontSize: 18),),
      ),
    );
  }
}