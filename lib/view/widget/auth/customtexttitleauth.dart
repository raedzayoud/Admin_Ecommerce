import 'package:flutter/material.dart';

class Customtexttitleauth extends StatelessWidget {
  final String title;
  const Customtexttitleauth({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
