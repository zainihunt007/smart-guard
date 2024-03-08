import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/colors/const_colors.dart';

class SmartGuardTagsScreen extends StatelessWidget {
  const SmartGuardTagsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.px),
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  text: 'Lets show you how ',
                  style: GoogleFonts.poppins(
                    fontSize: 16.px,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff444444),
                  ),
                  children: [
                    TextSpan(
                      text: 'Smart Guard ',
                      style: GoogleFonts.poppins(
                        fontSize: 14.px,
                        fontWeight: FontWeight.w400,
                        color: AppColors.appColorBlue,
                      ),
                    ),
                    TextSpan(
                      text: 'tag works',
                      style: GoogleFonts.poppins(
                        fontSize: 14.px,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff444444),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.h),
              Image.asset(
                'assets/SG-tracker 1.png',
                height: 28.h,
                width: 20.h,
              ),
              SizedBox(height: 2.h),
              Container(
                width: MediaQuery.of(context).size.width,
                // height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.px),
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
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 14.px, vertical: 8.px),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 6.h,
                                width: 6.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.px),
                                  border: Border.all(
                                      color: Colors.blue, width: 2),
                                  // color: Colors.red,
                                ),
                                child: Center(
                                  child: Text(
                                    '1',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20.px,
                                        color: AppColors.appColorBlue,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Container(
                                width: 4.px,
                                height: 25.px,
                                // color: Colors.blue,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff2F4D99),
                                      Color(0xff5BB9E2),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 6.h,
                                width: 6.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.px),
                                  border: Border.all(
                                      color: Colors.blue, width: 2),
                                  // color: Colors.red,
                                ),
                                child: Center(
                                  child: Text(
                                    '2',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20.px,
                                        color: AppColors.appColorBlue,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Container(
                                width: 4.px,
                                height: 5.1.h,
                                // color: Colors.blue,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff2F4D99),
                                      Color(0xff5BB9E2),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 6.h,
                                width: 6.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.px),
                                  border: Border.all(
                                      color: Colors.blue, width: 2),
                                  // color: Colors.red,
                                ),
                                child: Center(
                                  child: Text(
                                    '3',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20.px,
                                        color: AppColors.appColorBlue,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Container(
                                width: 4.px,
                                height: 7.2.h,
                                // color: Colors.blue,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff2F4D99),
                                      Color(0xff5BB9E2),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 6.h,
                                width: 6.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.px),
                                  border: Border.all(
                                      color: Colors.blue, width: 2),
                                  // color: Colors.red,
                                ),
                                child: Center(
                                  child: Text(
                                    '4',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20.px,
                                        color: AppColors.appColorBlue,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Container(
                                width: 4.px,
                                height: 5.3.h,
                                // color: Colors.blue,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff2F4D99),
                                      Color(0xff5BB9E2),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 6.h,
                                width: 6.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.px),
                                  border: Border.all(
                                      color: Colors.blue, width: 2),
                                  // color: Colors.red,
                                ),
                                child: Center(
                                  child: Text(
                                    '5',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20.px,
                                        color: AppColors.appColorBlue,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Container(
                                width: 4.px,
                                height: 25.px,
                                // color: Colors.blue,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff2F4D99),
                                      Color(0xff5BB9E2),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10.px),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Download App',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.px,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff2273B7),
                                  ),
                                ),
                                Text(
                                  'Download ‘Smart Guard’ app From your App store.',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11.px,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff515050),
                                  ),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  'Register yourself',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.px,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff2273B7),
                                  ),
                                ),
                                Text(
                                  'Create an account by using unique credentials or  by linking to existing accounts.',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11.px,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff515050),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.5.h,
                                ),
                                Text(
                                  'Connect Tag To Mobile',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.px,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff2273B7),
                                  ),
                                ),
                                Text(
                                  'On your device, go to Settings > Bluetooth, then turn on Bluetooth then choose “Smart Guard” from your Bluetooth settings.',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11.px,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff515050),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.5.h,
                                ),
                                Text(
                                  'Verification',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.px,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff2273B7),
                                  ),
                                ),
                                Text(
                                  'once the App is open, go to Menu > Personal information, enter required details.',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11.px,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff515050),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.5.h,
                                ),
                                Text(
                                  'Car Details',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.px,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff2273B7),
                                  ),
                                ),
                                Text(
                                  'Open App, go to Menu > My Car, enter required details to register your car.',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11.px,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff515050),
                                  ),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              Text(
                'After completing these steps you can securely drive your car.',
                style: GoogleFonts.poppins(
                  fontSize: 11.px,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff515050),
                ),
              ),
              SizedBox(height: 4.h,),
            ],
          ),
        ),),
      ),
    );
  }
}