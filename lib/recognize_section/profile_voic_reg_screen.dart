import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/recognize_section/reconize_screen.dart';
import 'package:smart_guard/widgets/auth.dart';
import 'package:smart_guard/widgets/reconize_screen.dart';
import 'package:smart_guard/widgets/verify_successfull_screen.dart';

class ProfileVoiceRecognizationScreen extends StatelessWidget {
  const ProfileVoiceRecognizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(
        title: 'Voice Recognition',
        subTitle: 'Press mic to start recording.',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.px),
        child: Column(
          children: [
            SizedBox(
              height: 17.h,
            ),
            Image.asset(
              'assets/recognize/microphone.png',
              height: 21.h,
              width: 21.h,
            ),
            SizedBox(height: 4.h),
            Image.asset(
              'assets/recognize/voice-layer.png',
              height: 6.h,
              width: 19.h,
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '01:12',
                  style: GoogleFonts.montserrat(
                    fontSize: 14.px,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff343434),
                  ),
                ),
                Image.asset(
                  'assets/pause.png',
                  width: 20.px,
                  height: 20,
                ),
                // SizedBox(width: 5,),
                Image.asset(
                  'assets/delete.png',
                  width: 20.px,
                  height: 20,
                ),
              ],
            ),
            SizedBox(height: 13.h),
            AccessButton(
                text: 'Done',
                ontap: () {
                  Get.to(() => VerificationSuccessfull(
                      title: 'Voice Recognition Successful',
                      ontap: () {
                        Get.to(() => RecognizeScreen());
                      },
                      buttonTitle: 'Back to homepage'));
                }),
          ],
        ),
      ),
    );
  }
}
