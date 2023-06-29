import 'package:flutter/material.dart';
import 'package:smartiky/utils/colors.dart';
import 'package:smartiky/utils/constants.dart';
import 'package:smartiky/utils/masks.dart';

class NewBalanceContent extends StatefulWidget {
  const NewBalanceContent({
    Key? key,
  }) : super(key: key);

  @override
  State<NewBalanceContent> createState() => _NewBalanceContentState();
}

class _NewBalanceContentState extends State<NewBalanceContent> {
  String? selectedItem;
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
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding + 5,
              ),
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              child: DropdownButton<String>(
                value: selectedItem,
                items: items.map((e) {
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
                  return items.map(
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
                    color: Colors.grey,
                  ),
                ),
                dropdownColor: AppColors.white,
                isExpanded: true,
                underline: Container(),
                onChanged: (value) {
                  setState(() {
                    selectedItem = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
