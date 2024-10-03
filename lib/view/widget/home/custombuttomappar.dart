import 'package:flutter/material.dart';

class Custombuttomappar extends StatelessWidget {
  final void Function()? onPressed;
  final String textappar;
  final IconData iconData;
  final Color color;
  const Custombuttomappar(
      {super.key,
      required this.onPressed,
      required this.textappar,
      required this.iconData,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: color,
          ),
          Text(
            textappar,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}