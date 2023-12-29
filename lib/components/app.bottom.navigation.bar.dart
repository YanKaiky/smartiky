import 'package:flutter/material.dart';
import 'package:smartiky/src/screens/home.screen.dart';
import 'package:smartiky/src/screens/new.balance.dart';
import 'package:smartiky/src/screens/profile.dart';
import 'package:smartiky/src/screens/statistics.screen.dart';
import 'package:smartiky/src/screens/notifications.dart';
import 'package:smartiky/utils/colors.dart';
import 'package:smartiky/utils/constants.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final int? index;

  const AppBottomNavigationBar({super.key, this.index});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  late int menuIndex = widget.index ?? 0;
  List screen = [
    const HomeScreen(),
    const StatisticsScreen(),
    const Notifications(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[menuIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const NewBalance();
            },
          ));
        },
        backgroundColor: AppColors.primary,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: AppColors.bgcolor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    menuIndex = 0;
                  });
                },
                child: Icon(
                  Icons.home_rounded,
                  size: 30,
                  color: menuIndex == 0 ? AppColors.primary : AppColors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    menuIndex = 1;
                  });
                },
                child: Icon(
                  Icons.bar_chart_outlined,
                  size: 30,
                  color: menuIndex == 1 ? AppColors.primary : AppColors.white,
                ),
              ),
              const SizedBox(width: defaultPadding * 2),
              GestureDetector(
                onTap: () {
                  setState(() {
                    menuIndex = 2;
                  });
                },
                child: Icon(
                  Icons.notifications_none_outlined,
                  size: 30,
                  color: menuIndex == 2 ? AppColors.primary : AppColors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    menuIndex = 3;
                  });
                },
                child: Icon(
                  Icons.person_outline_rounded,
                  size: 30,
                  color: menuIndex == 3 ? AppColors.primary : AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
