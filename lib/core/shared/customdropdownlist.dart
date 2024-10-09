import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class Customdropdownlist extends StatefulWidget {
  final String title;
  final List<SelectedListItem> list;
  final TextEditingController drop_down_list_name;
  final TextEditingController drop_down_list_id;
  Customdropdownlist(
      {super.key,
      required this.title,
      required this.drop_down_list_name,
      required this.drop_down_list_id,
      required this.list});

  @override
  State<Customdropdownlist> createState() => _CustomdropdownlistState();
}

class _CustomdropdownlistState extends State<Customdropdownlist> {
  showDropDown(BuildContext context) {
    DropDownState(
      DropDown(
        bottomSheetTitle: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.list,
        onSelected: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem=selectedList[0];
          widget.drop_down_list_name.text=selectedListItem.name;
          widget.drop_down_list_id.text=selectedListItem.value!;
        },
        //  enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: TextFormField(
        style: const TextStyle(color: Colors.black),
        controller: widget.drop_down_list_name,
        cursorColor: Colors.black,
        onTap: () {
          FocusScope.of(context).unfocus();
          showDropDown(context);
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black12,
          contentPadding:
              const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
          hintText: widget.drop_down_list_name.text == ""
              ? widget.title
              : widget.drop_down_list_name.text,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
