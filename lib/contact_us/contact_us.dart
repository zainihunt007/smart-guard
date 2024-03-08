import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/widgets/auth.dart';
import 'package:smart_guard/widgets/reconize_screen.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(title: 'Contact our support team'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 17.px),
              Center(
                child: Image.asset(
                  'assets/message.png',
                  height: 22.h,
                  width: 25.h,
                ),
              ),
              SizedBox(height: 17.px),
              Text(
                'From',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.px,
                  color: Colors.black,
                ),
              ),
              Text(
                'Tell us who you are! or stay anonymous ',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.px,
                  color: Color(0xff5A5A5A),
                ),
              ),
              SizedBox(height: 14.px),
              CustomTextField(
                  image: 'assets/auth/email.png', hinttext: 'Email'),
              SizedBox(height: 14.px),
              CustomTextField(
                  image: 'assets/auth/Vector.png',
                  hinttext: 'Phone',
                  keyboardTypePhone: true),
              SizedBox(height: 14.px),
              Text(
                'Message',
                style: GoogleFonts.poppins(
                  fontSize: 14.px,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff383838),
                ),
              ),
              Container(
                height: 20.h,
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
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    ' Lorem ipsum dolor sit amet consectetur. Sed maecenas ullamcorper a velit aliquam. Eu morbi nunc enim consequat. Sit congue elementum sit ultricies lorem. Sed malesuada dictumst eu arcu nisi viverra mattis in lectus. Id erat nunc convallis hac viverra cras sagittis ultricies. Enim nisl aliquet diam.',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.px,
                        color: Color(0xffA6A6A6)),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              AccessButton(text: 'Submit', ontap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
