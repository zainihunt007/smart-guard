import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/recognize_section/profile_face_reg_screen.dart';
import 'package:smart_guard/widgets/reconize_screen.dart';

class ProfileFaceRecognization extends StatelessWidget {
  const ProfileFaceRecognization({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(title: 'Face Recognition'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/face-scanner.png',
              height: 296,
              width: 305,
            ),
          ),
          SizedBox(height: 40.px),
          GestureDetector(
            onTap: (){
              Get.to(() => const ProfileFaceRecognizationScreen());
            },
            child: Text(
              'PLace  face within the Frame',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 12.px,
                color: Color(0xff717171),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
