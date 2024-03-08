import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/recognize_section/reconize_screen.dart';
import 'package:smart_guard/widgets/auth.dart';

class SecurityAlertScreen extends StatelessWidget {
  const SecurityAlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'security Alert',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 13.px,
            color: Color(0xff222222),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.px),
        child: Column(
          children: [
            Text(
              'security Alert',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 10.px,
                color: Color(0xff494949),
              ),
            ),
            Image.asset(
              'assets/security alert.png',
              height: 33.h,
              width: 33.h,
            ),
            SizedBox(height: 3.8.h),
            Text(
              '*Nearest Police station has been informed',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 14.px,
                color: Color(0xffF10404),
              ),
            ),
            SizedBox(height: 10.px),
            Text(
              'Car details has been shared with the police.',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 10.px,
                color: Color(0xff494949),
              ),
            ),
            SizedBox(height: 10.px),
            Container(
              width: 270,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.px),
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
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        'Car details',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 11.px,
                          color: Color(0xff222222),
                        ),
                      ),
                      SizedBox(height: 4.px),
                      Text(
                        'Mini Cooper gp',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 11.px,
                          color: Color(0xffA6A6A6),
                        ),
                      ),
                      SizedBox(height: 4.px),
                      Text(
                        'BD51 SMR',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 11.px,
                          color: Color(0xffA6A6A6),
                        ),
                      ),
                      SizedBox(height: 4.px),
                      Text(
                        '2021',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 11.px,
                          color: Color(0xffA6A6A6),
                        ),
                      ),
                      SizedBox(height: 4.px),
                      Text(
                        'Black',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 11.px,
                          color: Color(0xffA6A6A6),
                        ),
                      ),
                      SizedBox(height: 4.px),
                    ],
                  ),
                  SizedBox.shrink(),
                ],
              ),
            ),
            SizedBox(height: 30.px),
            AccessButton(text: 'Back to homepage', ontap: (){
              Get.to(() => RecognizeScreen());
            })
          ],
        ),
      ),
    );
  }
}
