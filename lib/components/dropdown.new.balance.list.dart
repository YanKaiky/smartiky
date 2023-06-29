// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smartiky/utils/colors.dart';

import 'package:smartiky/utils/constants.dart';
import 'package:smartiky/utils/masks.dart';

class DropDownNewBalanceList extends StatefulWidget {
  final Function(String?) onChanged;
  final List<String> items;
  final String value;

  const DropDownNewBalanceList({
    Key? key,
    required this.onChanged,
    required this.items,
    required this.value,
  }) : super(key: key);

  @override
  State<DropDownNewBalanceList> createState() => _DropDownNewBalanceListState();
}

class _DropDownNewBalanceListState extends State<DropDownNewBalanceList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding + 5,
      ),
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: AppColors.grey,
        ),
      ),
      child: DropdownButton<String>(
        value: widget.value,
        items: widget.items.map((e) {
          return DropdownMenuItem(
            value: e,
            child: Row(
              children: [
                SizedBox(
                  width: 25,
                  child: Image.asset(icons(e)),
                ),
                const SizedBox(width: defaultPadding * 2),
                Text(
                  e,
                  style: const TextStyle(
                    fontSize: defaultPadding + 5,
                    color: AppColors.text,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        selectedItemBuilder: (BuildContext context) {
          return widget.items.map(
            (e) {
              return Row(
                children: [
                  SizedBox(
                    width: 30,
                    child: Image.asset(icons(e)),
                  ),
                  const SizedBox(width: defaultPadding * 2),
                  Text(
                    e,
                    style: const TextStyle(
                      fontSize: defaultPadding + 5,
                      color: AppColors.text,
                    ),
                  ),
                ],
              );
            },
          ).toList();
        },
        hint: const Text(
          "Name",
          style: TextStyle(
            color: AppColors.grey,
          ),
        ),
        dropdownColor: AppColors.white,
        isExpanded: true,
        underline: Container(),
        onChanged: widget.onChanged,
      ),
    );
  }
}
