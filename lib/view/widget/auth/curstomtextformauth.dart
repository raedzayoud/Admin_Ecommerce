import 'package:flutter/material.dart';

class Curstomtextformauth extends StatelessWidget {
  final String hintText;
  final String label;
  final IconData iconData;
  TextEditingController? mycontroller;
  final String? Function(String?)? validator;
  bool? obscturetext;
  TextInputType type;
  void Function()? onTapIcon;
  Curstomtextformauth(
      {super.key,
      required this.hintText,
      required this.label,
      required this.iconData,
      required this.mycontroller,
      required this.validator,
      this.type = TextInputType.text,
      this.obscturetext,
      this.onTapIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 17),
      child: TextFormField(
        obscureText:
            obscturetext == false || obscturetext == null ? false : true,
        keyboardType: type,
        validator: validator,
        controller: mycontroller,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14),
            suffixIcon: InkWell(
              child: Icon(iconData),
              onTap: onTapIcon,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            label: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(label)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
