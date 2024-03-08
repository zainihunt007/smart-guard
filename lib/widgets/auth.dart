import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/colors/const_colors.dart';

class AccessButton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  final String? image;
  AccessButton({super.key, required this.text, required this.ontap,this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 44.px,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.px),
          color: AppColors.appColorBlue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           image != null ? Image.asset(image!,height: 12,width: 12,) : const SizedBox.shrink(),
            SizedBox(width: 10.px),
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 16.px,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hinttext;
  final String image;
  String? sfxImage;
  final TextEditingController? controller;
  final VoidCallback? sfxOntap;
  final bool readOnly;
  final VoidCallback? ontap;
  final bool? keyboardTypePhone;
  final bool obscureText;
  CustomTextField(
      {super.key,
      required this.image,
      required this.hinttext,
      this.sfxOntap,
      this.sfxImage,
      this.ontap,
      this.keyboardTypePhone = false,
      this.readOnly = false,
      this.controller,
      this.obscureText = false,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.px,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(22),
      ),
      child: TextFormField(
        keyboardType: (keyboardTypePhone ?? false)
            ? TextInputType.phone
            : TextInputType.text,
        readOnly: readOnly,
        controller: controller,
        onTap: ontap,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hinttext,
          hintStyle: GoogleFonts.poppins(
            fontSize: 12.px,
            fontWeight: FontWeight.w400,
            color: Color(0xffA6A6A6),
          ),
          contentPadding: const EdgeInsets.only(top: 5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(vertical: 8),
            width: 8,
            height: 8,
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          suffixIcon: sfxImage != null
              ? GestureDetector(
                  onTap: sfxOntap,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: 8,
                    height: 8,
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        sfxImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

class SocialAuth extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback ontap;
  const SocialAuth(
      {super.key,
      required this.title,
      required this.image,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 44.px,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.px),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 24,
              width: 24,
            ),
            SizedBox(width: 10.px),
            Text(
              title,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 12.px,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
