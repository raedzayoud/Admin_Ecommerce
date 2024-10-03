import 'package:admin_ecommerce/core/constant/imageassets.dart';
import 'package:flutter/material.dart';

class Logoauth extends StatelessWidget {
  const Logoauth({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
    scale: 0.8,
    child: ClipOval(child: Image.asset(AppImageassets.logoauth)));
  }
}