import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/core/constant/imageassets.dart';
import 'package:flutter/material.dart';

class Cardhome extends StatelessWidget {
  final String title;
  final String url;
  final void Function()? onTap;

  const Cardhome(
      {super.key, required this.title, required this.url, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: AppColor.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              url,
              height: 80,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "${title}",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
