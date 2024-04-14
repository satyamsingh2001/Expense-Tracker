import 'package:expense_tracker/colors/colors_const.dart';
import 'package:expense_tracker/routes/routes.dart';
import 'package:expense_tracker/styles/text_style_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    // Simulate a splash screen delay
    await Future.delayed(const Duration(seconds: 3));

    Get.offNamed(ApplicationPages.homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
          child: Text(
        "Expense Tracker App....",
        style: AppTextStyles.kBody17SemiBoldTextStyle
            .copyWith(color: AppColors.primary),
      )),
    );
  }
}
