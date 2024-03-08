import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/recognize_section/profile_screen.dart';
import 'package:smart_guard/recognize_section/voice_recognization_screen.dart';
import 'package:smart_guard/widgets/auth.dart';

import '../colors/const_colors.dart';
import '../widgets/reconize_screen.dart';
import 'faceregognization_screen.dart';

class RecognizeYourselfScreen extends StatelessWidget {
   RecognizeYourselfScreen({super.key});
  final PersonalInfoController personalInfoController =
  Get.put(PersonalInfoController());

  @override
  Widget build(BuildContext context) {
    personalInfoController.fetchPersonalInfo();
    final personalInfo = personalInfoController.personalInfo;
    print('profile picUrl: ${personalInfo?.profilePic}');
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_rounded,
              color: Colors.black, size: 15.px),
        ),
        actions: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.black,
            backgroundImage: personalInfo != null &&
                personalInfo.profilePic.isNotEmpty
                ? NetworkImage(personalInfo.profilePic)
                : AssetImage('assets/Ellipse 227.png') as ImageProvider,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recognize yourself',
              style: GoogleFonts.poppins(
                fontSize: 13.px,
                fontWeight: FontWeight.w500,
                color: const Color(0xff222222),
              ),
            ),
            Text(
              'Choose any of the methods for Recognition.',
              style: GoogleFonts.poppins(
                fontSize: 10.px,
                fontWeight: FontWeight.w400,
                color: const Color(0xff494949),
              ),
            ),
            SizedBox(height: 30.px),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Get.to(() => const FaceRecognizationScreen());
                    },
                    child: Container(
                      height: 19.75.h,
                      // width: 150.px,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19.px),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(
                              2,
                              2,
                            ), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/recognize/face.png',
                            height: 30.px,
                            width: 30.px,
                          ),
                          Text(
                            'Face Recognition',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400, fontSize: 13.px,color: const Color(0xff757575),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15.px),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Get.to(() => const VoiceRecognizationScreen());
                    },
                    child: Container(
                      height: 19.75.h,
                      // width: 150.px,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19.px),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(
                              2,
                              2,
                            ), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/recognize/voice.png',
                            height: 30.px,
                            width: 30.px,
                          ),
                          Text(
                            'Voice Recognition',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400, fontSize: 13.px,color: const Color(0xff757575),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 9.5.h),
            AccessButton(text: 'Next', ontap: (){
              // Get.to(() => const FaceRecognizationScreen());
            }),
          ],
        ),
      ),
    );
  }
}
