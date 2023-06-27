import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartiky/components/app.bottom.navigation.bar.dart';
import 'package:smartiky/utils/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smartiky',
      theme: ThemeData.dark().copyWith(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.bgcolor,
        canvasColor: AppColors.bgcolor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: AppColors.white)
            .copyWith(
              bodyText1: const TextStyle(color: AppColors.text),
              bodyText2: const TextStyle(color: AppColors.text),
            ),
      ),
      // home: const HomeScreen(),
      // home: const StatisticsScreen(),
      home: const AppBottomNavigationBar(),
    );
  }
}
