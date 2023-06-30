import 'package:flutter/material.dart';

import 'package:smartiky/utils/colors.dart';
import 'package:smartiky/utils/constants.dart';

class TextFieldDate extends StatefulWidget {
  final void Function() onPressed;
  final String label;

  const TextFieldDate({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<TextFieldDate> createState() => _TextFieldDateState();
}

class _TextFieldDateState extends State<TextFieldDate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultPadding),
        border: Border.all(width: 1, color: AppColors.grey),
      ),
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      width: 300,
      child: TextButton(
        onPressed: widget.onPressed,
        child: Text(
          widget.label,
          style: const TextStyle(
            fontSize: defaultPadding + 6,
            color: AppColors.text,
          ),
        ),
      ),
    );
  }
}
