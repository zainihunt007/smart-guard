import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/widgets/verify_successfull_screen.dart';
import 'package:smart_guard/widgets/auth.dart';

import '../colors/const_colors.dart';
import '../recognize_section/reconize_screen.dart';
import '../smartguard_tags_screen.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 29.5.h,
                  width: MediaQuery.of(context).size.width,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(15.px),
                  //   color: Colors.white,
                  //   boxShadow: [
                  //     BoxShadow(
                  //       color: Colors.black.withOpacity(0.2),
                  //       spreadRadius: 1,
                  //       blurRadius: 4,
                  //       offset: Offset(
                  //         1,
                  //         1,
                  //       ), // changes position of shadow
                  //     ),
                  //   ],
                  // ),
                  child: Image.asset('assets/auth/otp-email.png'),
                ),
              ),
              SizedBox(
                height: 14.px,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.px),
                child: Column(
                  children: [
                    Text(
                      'OTP verification',
                      style: GoogleFonts.poppins(
                        fontSize: 24.px,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryBlackText,
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'Enter the verification code that we sent to your email Litahan12@gmail.com',
                      style: GoogleFonts.poppins(
                        fontSize: 10.px,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryBlackText,
                      ),
                    ),
                    SizedBox(
                      height: 34.px,
                    ),
                    OtpTextField(
                      numberOfFields: 4,
                      borderColor: Color(0xFF512DA8),
                      showFieldAsBox: true,
                      fillColor: Color(0xffF3F5F7),
                      filled: true,
                      fieldWidth: 68.px,
                      borderRadius: BorderRadius.circular(6.px),
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Verification Code"),
                                content:
                                    Text('Code entered is $verificationCode'),
                              );
                            });
                      }, // end onSubmit
                    ),
                    SizedBox(
                      height: 15.px,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.px),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: RichText(
                          text: TextSpan(
                            text: 'Expires in ',
                            style: GoogleFonts.poppins(
                              fontSize: 14.px,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff59636B),
                            ),
                            children: [
                              TextSpan(
                                text: '02:10',
                                style: GoogleFonts.poppins(
                                  fontSize: 14.px,
                                  // fontWeight: FontWeight.w400,
                                  color: Color(0xff1E1E1E),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 34.px,
                    ),
                    AccessButton(
                        text: 'Verify',
                    ontap: (){
                      Get.to(
                            () => VerificationSuccessfull(
                          title: 'Verification Successful',
                          buttonTitle: 'Return to Login',
                          ontap: () {
                            Get.to(() => const SmartGuardTagsScreen());
                          },
                        ),
                      );
                    },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// 'Expires in 02:10',
// style: GoogleFonts.poppins(
// fontSize: 14.px,
// fontWeight: FontWeight.w400,
// color: Color(0xff59636B),
// ),
