// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smartiky/components/button.save.dart';

import 'package:smartiky/components/dropdown.new.balance.how.dart';
import 'package:smartiky/components/dropdown.new.balance.list.dart';
import 'package:smartiky/components/text.field.content.dart';
import 'package:smartiky/components/text.field.date.dart';
import 'package:smartiky/utils/colors.dart';
import 'package:smartiky/utils/constants.dart';

class NewBalanceContent extends StatefulWidget {
  const NewBalanceContent({
    Key? key,
  }) : super(key: key);

  @override
  State<NewBalanceContent> createState() => _NewBalanceContentState();
}

class _NewBalanceContentState extends State<NewBalanceContent> {
  DateTime date = DateTime.now();

  final TextEditingController explain = TextEditingController();
  FocusNode ex = FocusNode();

  final TextEditingController amount = TextEditingController();
  FocusNode am = FocusNode();

  String selectedItem = "Others";
  final List<String> items = [
    "Coffee",
    "Disney+",
    "Energy",
    "Food",
    "HBO",
    "Internet",
    "Movie",
    "Netflix",
    "Payment",
    "Star+",
    "StarBucks",
    "Travel",
    "Others",
  ];

  String selectedHow = "Income";
  final List<String> hows = [
    "Expand",
    "Income",
  ];

  @override
  void initState() {
    super.initState();

    ex.addListener(() {
      setState(() {});
    });

    am.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 120,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: defaultPadding * 5,
          horizontal: defaultPadding + 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.white,
        ),
        height: 600,
        width: 340,
        child: Column(
          children: [
            DropDownNewBalanceList(
              onChanged: (value) {
                setState(() {
                  selectedItem = value!;
                });
              },
              items: items,
              value: selectedItem,
            ),
            const SizedBox(height: 30),
            TextFieldContent(
              labelText: "Explain...",
              controller: explain,
              focusNode: ex,
            ),
            const SizedBox(height: 30),
            TextFieldContent(
              labelText: "Amount",
              controller: amount,
              focusNode: am,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            DropDownNewBalanceHow(
              onChanged: (value) {
                setState(() {
                  selectedHow = value!;
                });
              },
              hows: hows,
              value: selectedHow,
            ),
            const SizedBox(height: 30),
            TextFieldDate(
              label:
                  'Date: ${date.day < 10 ? "0${date.day}" : date.day}/${date.month < 10 ? "0${date.month}" : date.month}/${date.year}',
              onPressed: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2060),
                );

                if (newDate == null) return;

                setState(() {
                  date = newDate;
                });
              },
            ),
            const Spacer(),
            ButtonSave(label: 'Save', onTap: () {}),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
