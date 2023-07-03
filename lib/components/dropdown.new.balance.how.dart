// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smartiky/utils/colors.dart';

import 'package:smartiky/utils/constants.dart';

class DropDownNewBalanceHow extends StatefulWidget {
  final Function(String?) onChanged;
  final List<String> hows;
  final String value;

  const DropDownNewBalanceHow({
    Key? key,
    required this.onChanged,
    required this.hows,
    required this.value,
  }) : super(key: key);

  @override
  State<DropDownNewBalanceHow> createState() => _DropDownNewBalanceHowState();
}

class _DropDownNewBalanceHowState extends State<DropDownNewBalanceHow> {
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
        items: widget.hows.map((e) {
          return DropdownMenuItem(
            value: e,
            child: Row(
              children: [
                Icon(
                  e == 'Income' ? Icons.arrow_downward : Icons.arrow_upward,
                  color: e == 'Income' ? AppColors.primaryBlack : Colors.red,
                  size: 19,
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
          return widget.hows.map(
            (e) {
              return Row(
                children: [
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
        icon: Icon(
          widget.value == 'Income' ? Icons.arrow_downward : Icons.arrow_upward,
          color: widget.value == 'Income' ? AppColors.primaryBlack : Colors.red,
          size: 19,
        ),
        hint: const Text(
          "How",
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
