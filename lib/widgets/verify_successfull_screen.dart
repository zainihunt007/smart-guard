import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/widgets/auth.dart';

class VerificationSuccessfull extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final VoidCallback ontap;
  const VerificationSuccessfull(
      {super.key,
      required this.title,
      required this.ontap,
      required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
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
                child: Image.asset('assets/auth/verify_successfull.png'),
              ),
              SizedBox(
                height: 30.px,
              ),
              Text(
                textAlign: TextAlign.center,
                title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.px,
                  color: Color(0xff444444),
                ),
              ),
              SizedBox(height: 30.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.px),
                child: AccessButton(
                  text: buttonTitle,
                  ontap: ontap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
