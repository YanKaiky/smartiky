import 'package:flutter/material.dart';
import 'package:smartiky/utils/colors.dart';
import 'package:smartiky/utils/constants.dart';

class TextFieldContent extends StatelessWidget {
  const TextFieldContent({
    Key? key,
    required this.labelText,
    this.prefix,
    this.prefixIcon,
    required this.controller,
    required this.focusNode,
    this.keyboardType,
  }) : super(key: key);

  final String labelText;
  final String? prefix;
  final IconData? prefixIcon;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        style: const TextStyle(color: AppColors.text),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(defaultPadding + 5),
          labelText: labelText,
          labelStyle: TextStyle(color: AppColors.grey.shade600),
          prefix: prefix != null
              ? Text(
                  prefix!,
                  style: const TextStyle(color: AppColors.grey),
                )
              : null,
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: AppColors.grey)
              : null,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: AppColors.grey),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.primary,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
