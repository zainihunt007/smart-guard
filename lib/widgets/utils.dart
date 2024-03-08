import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../colors/const_colors.dart';

customScaffoldMessenger(
    BuildContext context,
    String text,
    ) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: GoogleFonts.poppins(
          // fontFamily: Constants.fontsFamilyRegular,
          fontSize: 14.sp,
        ),
      ),
      backgroundColor: AppColors.toastColor,
      duration: const Duration(seconds: 2),
    ),
  );
}
