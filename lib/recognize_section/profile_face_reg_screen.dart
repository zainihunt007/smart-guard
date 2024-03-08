import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/recognize_section/reconize_screen.dart';
import 'package:smart_guard/recognize_section/voice_recognization_screen.dart';
import 'package:smart_guard/widgets/auth.dart';

import '../widgets/reconize_screen.dart';
import '../widgets/verify_successfull_screen.dart';

class ProfileFaceRecognizationScreen extends StatelessWidget {
  const ProfileFaceRecognizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(
        title: 'Face Recognition',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.px),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/recognize/face_two 1.png'),
            SizedBox(height: 5.h),
            SizedBox(height: 8.h),
            AccessButton(
                text: 'Done',
                ontap: () {
                  Get.to(
                    () => VerificationSuccessfull(
                      title: 'Face Recognition Successful',
                      buttonTitle: 'Back to homepage',
                      ontap: () {
                        Get.to(() => RecognizeScreen());
                      },
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
