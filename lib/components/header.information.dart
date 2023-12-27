import 'package:flutter/material.dart';
import 'package:smartiky/utils/colors.dart';
import 'package:smartiky/utils/constants.dart';

class HeaderInformation extends StatelessWidget {
  const HeaderInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 35,
                left: MediaQuery.of(context).size.width - 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Container(
                    height: 40,
                    width: 40,
                    color: AppColors.backWhite,
                    child: IconButton(
                      icon: const Icon(
                        Icons.notifications_none_outlined,
                        color: AppColors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: defaultPadding * 3,
                  left: defaultPadding * 3,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Afternoon',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.bgcolor,
                      ),
                    ),
                    Text(
                      'Yan Kaiky',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
