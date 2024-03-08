import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/colors/const_colors.dart';
import 'package:smart_guard/recognize_section/profile_screen.dart';
import 'package:smart_guard/recognize_section/recognize_yourself_screen.dart';
import 'package:smart_guard/widgets/auth.dart';
import '../widgets/reconize_screen.dart';

class RecognizeScreen extends StatelessWidget {
  RecognizeScreen({super.key});

  // PersonalInfo? personalInfo;
  final PersonalInfoController personalInfoController =
      Get.put(PersonalInfoController());

  @override
  Widget build(BuildContext context) {
    personalInfoController.fetchPersonalInfo();
    // final personalInfo = personalInfoController.personalInfo;
    log("profile pic${personalInfoController.personalInfo?.profilePic.toString()}");
    return Scaffold(
      appBar: AppBar(
        actions: [
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.appColorBlue,
            backgroundImage:
            personalInfoController.personalInfo != null &&
                personalInfoController
                    .personalInfo!.profilePic != null &&
                personalInfoController
                    .personalInfo!.profilePic.isNotEmpty
                ? NetworkImage(personalInfoController.personalInfo!.profilePic)
                : const AssetImage('assets/Ellipse 227.png')
            as ImageProvider,
          ),
          SizedBox(width: 10),
        ],
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: Column(
          children: [
            SizedBox(height: 15.px),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome Back Lisa!',
                style: GoogleFonts.poppins(
                    fontSize: 13.px,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            SizedBox(height: 34.px),
            Container(
              height: 29.5.h,
              // width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.px),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(
                      1,
                      1,
                    ), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.px),
                child: Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/recognize/Rectangle 442.png',
                        fit: BoxFit.cover,
                        // height: 500,
                      ),
                    ),
                    Image.asset('assets/recognize/car.png'),
                    Positioned(
                      top: 5,
                      left: 120,
                      child: Text(
                        'Mini Cooper gp',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 10.px,
                          color: Color(0xff6D6D6D),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.px),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Engine Status'),
                SizedBox(width: 6.px),
                CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.green,
                ),
                SizedBox(width: 26.px),
                GestureDetector(
                    onTap: () {
                      // Get.to(() => CarDetailsScreen());
                    },
                    child: Text('Fuel Status')),
                SizedBox(width: 6.px),
                CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.green,
                ),
              ],
            ),
            SizedBox(height: 69.px),
            AccessButton(
                text: 'Recognize yourself to start drive',
                ontap: () {
                  Get.to(() => RecognizeYourselfScreen());
                }),
          ],
        ),
      ),
    );
  }
}
