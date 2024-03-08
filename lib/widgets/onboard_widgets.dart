import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_guard/auth/signup_screen.dart';

import '../colors/const_colors.dart';

class StartedButton extends StatelessWidget {
  const StartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('hasCompletedOnboarding', true);
        Get.offAll(() => SignupScreen());
      },
      child: Container(
        height: 38,
        width: 178,
        // color: Colors.red,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.46.px),
          color: AppColors.appColorBlue,
        ),
        child: Center(
          child: Text(
            'Get Started',
            style: GoogleFonts.quicksand(
              fontSize: 14.px,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
