import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/recognize_section/reconize_screen.dart';

import '../widgets/auth.dart';

class DrvieOTPVerificatinScreen extends StatelessWidget {
  const DrvieOTPVerificatinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset('assets/drive_verify.png',height: 153,width: 134,),
              SizedBox(
                height: 30.px,
              ),
              Text(
                textAlign: TextAlign.center,
                'OTP Verification was\nSuccessful!',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.px,
                  color: Color(0xff444444),
                ),
              ),
              SizedBox(
                height: 8.px,
              ),
              Text(
                textAlign: TextAlign.center,
                'you’ve got the access to drive Lita Han’s Car.',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 10.px,
                  color: const Color(0xff494949),
                ),
              ),
              SizedBox(height: 30.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.px),
                child: AccessButton(
                  text: 'Ok',
                  ontap: (){
                    Get.offAll(() => RecognizeScreen());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
