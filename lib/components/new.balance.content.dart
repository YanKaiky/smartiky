import 'package:flutter/material.dart';
import 'package:smartiky/components/dropdown.new.balance.list.dart';
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
  final TextEditingController explain = TextEditingController();
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
        height: 550,
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
            const SizedBox(height: 50),
            TextField(
              controller: explain,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(defaultPadding + 5),
                labelText: "Explain",
                filled: true,
                labelStyle: TextStyle(color: AppColors.grey.shade600),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 3,
                    color: AppColors.title,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
