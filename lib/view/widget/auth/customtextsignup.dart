import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class Customtextsignup extends StatelessWidget {
  final String textone;
  final String textwo;
  final Function()? onTap;
  const Customtextsignup({super.key, required this.textone, required this.textwo,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone),
        InkWell(
          onTap: onTap,
          child: Text(
            textwo,
            style: TextStyle(color: AppColor.primaycolor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
