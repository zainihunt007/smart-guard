import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_guard/auth/signin_screen.dart';
import 'package:smart_guard/recognize_section/profile_screen.dart';
import 'package:smart_guard/recognize_section/reconize_screen.dart';
import 'colors/const_colors.dart';
import 'onboard_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  final PersonalInfoController personalInfoController =
  Get.put(PersonalInfoController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
          () {
      nextScreen();
    },);
    personalInfoController.fetchPersonalInfo();
  }

  Future<void> nextScreen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool hasCompletedOnboarding = prefs.getBool('hasCompletedOnboarding') ?? false;

    bool isLogin = prefs.getBool('isLogin') ?? false;

    if (!hasCompletedOnboarding) {
      Get.offAll(() => OnboardingScreen());
    } else if (!isLogin) {
      Get.offAll(() => SignInScreen());
    } else {
      Get.offAll(() => RecognizeScreen());
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Smart Guard',
          style: GoogleFonts.crimsonText(
            fontSize: 32.px,
            fontWeight: FontWeight.w400,
            color: AppColors.appColorBlue,
          ),
        ),
      ),
    );
  }
}
