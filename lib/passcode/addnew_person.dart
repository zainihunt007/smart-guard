import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/widgets/auth.dart';
import '../recognize_section/reconize_screen.dart';
import '../widgets/reconize_screen.dart';
import '../widgets/verify_successfull_screen.dart';

class AddNewPersonScreen extends StatelessWidget {
  const AddNewPersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleAppBar(
        title: 'Add New Person',
        subTitle:
            'Add the details of person you want to add along 4-digit\npasscode.',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.px),
        child: Column(
          children: [
            SizedBox(height: 3.7.h),
            CustomTextField(
                image: 'assets/auth/person.png', hinttext: 'Juan Matt'),
            SizedBox(height: 3.7.h),
            SizedBox(
              height: 44.px,
              child: Container(
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
                  // controller: controller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Phone',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 12.px,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffA6A6A6),
                      ),
                      contentPadding: const EdgeInsets.only(top: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const CountryCodePicker(
                        hideMainText: true,
                        onChanged: print,
                        initialSelection: 'United Kingdom',
                        favorite: ['+44', 'UK'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                        flagWidth: 20,
                        padding: EdgeInsets.all(0),
                        showFlagMain: true,
                      )),
                ),
              ),
            ),
            SizedBox(height: 3.7.h),
            CustomTextField(image: 'assets/auth/Group.png', hinttext: '0011'),
            SizedBox(height: 10.px),
            Text(
              '*When you’ll hit the “Add Person” button, 4-digit passcode will be shared to this person on provided number.',
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                fontSize: 10.px,
                fontWeight: FontWeight.w400,
                color: const Color(0xff494949),
              ),
            ),
            SizedBox(height: 6.8.h),
            AccessButton(text: 'Add Person', ontap: (){
              Get.to(
                    () => VerificationSuccessfull(
                  title: 'one-time Passcode Issued Successfully',
                  buttonTitle: 'Back to homepage',
                  ontap: () {
                    Get.to(() => RecognizeScreen());
                  },
                ),
              );
            },image: 'assets/add person.png',),
          ],
        ),
      ),
    );
  }
}
