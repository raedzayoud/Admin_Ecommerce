import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class Customtextbodyauth extends StatelessWidget {
  final String body;
  const Customtextbodyauth({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Text(
          body,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: AppColor.grey, fontSize: 15),
        ));
  }
}
