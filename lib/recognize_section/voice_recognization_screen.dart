import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/recognize_section/reconize_screen.dart';
import 'package:smart_guard/widgets/auth.dart';
import 'package:smart_guard/widgets/reconize_screen.dart';

class VoiceRecognizationScreen extends StatelessWidget {
  const VoiceRecognizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleAppBar(
        title: 'Voice Recognition',
        subTitle: 'Press mic to start recording.',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.px),
        child: Column(
          children: [
            SizedBox(
              height: 13.h,
            ),
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: 'Time left ',
                  style: GoogleFonts.poppins(
                    fontSize: 14.px,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff59636B),
                  ),
                  children: [
                    TextSpan(
                      text: '02:10',
                      style: GoogleFonts.poppins(
                        fontSize: 14.px,
                        // fontWeight: FontWeight.w400,
                        color: const Color(0xff1E1E1E),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 4.h),
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
            SizedBox(height: 7.h),
            Text(
              textAlign: TextAlign.center,
              'Face Recognition is Successful. You can drive the car.',
              style: GoogleFonts.poppins(
                fontSize: 13.px,
                fontWeight: FontWeight.w500,
                color: const Color(0xff4CAF50),
              ),
            ),
            SizedBox(height: 13.h),
            AccessButton(
                text: 'Ok',
                ontap: () {
                  // openVoiceRecognizeDialog();
                  Get.back();
                }),
          ],
        ),
      ),
    );
  }
}

void openVoiceRecognizeDialog() {
  Get.dialog(
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Material(
                child: Column(
                  children: [
                    // SizedBox(height: 32.h),
                    Text(
                      "Voice Recognition is Failed.",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 13.px,
                        color: const Color(0xffFF2121),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5.px),
                    Image.asset(
                      'assets/recognize/image 1.png',
                      width: 200,
                      height: 156,
                    ),
                    Text(
                      'Voice Recognition has been failed, you can try another option',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.px,
                        color: const Color(0xffA6A6A6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 22.px),
                    AccessButton(
                        text: 'Back to homepage',
                        ontap: () {
                          Get.to(() =>  RecognizeScreen());
                        }),
                    //Buttons
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
